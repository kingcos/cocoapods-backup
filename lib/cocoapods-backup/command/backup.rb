module Pod
    class Podfile
        module DSL
            # Saving original pod method
            pod_method = instance_method(:pod)

            # Exchanging methods
            define_method(:pod) do |name, *args|
                unless args.last.is_a?(Hash)
                    # Calling original pod method
                    pod_method.bind(self).(name, *args)
                    return
                end

                # :backup => true
                should_backup = args.last.delete(:backup)
                sandbox = Config.instance.sandbox

                if should_backup
                    # 0. Using pod when only import subspec
                    # (eg. pod 'OHHTTPStubs/Swift', only OHHTTPStubs.podspec.json exists)
                    pod_name = name.split("/")[0]

                    # 1. Finding MyPod.podspec.json
                    podspec_json_filename = "#{pod_name}.podspec.json"
                    # Pods/Local Podspecs/ + MyPod.podspec.json
                    podspec_json_original_path = Pathname.new("Pods/Local Podspecs") + podspec_json_filename
                    # Pods/MyPod
                    pod_source_path = Pathname.new("Pods") + pod_name
                    # Pods/MyPod/MyPod.podspec.json
                    podspec_json_dest_path = Pathname.new("Pods/#{pod_name}") + podspec_json_filename

                    if !podspec_json_original_path.exist?
                        Pod::UI.warn "[cocoapods-backup] Cannot finding #{pod_name}.podspec.json in your Pods/Local Podspecs path."
                        pod_method.bind(self).(name, *args)
                        return
                    end

                    # 2. ln -s Pods/Local Podspecs/MyPod.podspec.json Pods/MyPod/MyPod.podspec.json
                    if File.symlink? (podspec_json_dest_path)
                        File.delete(podspec_json_dest_path)
                    end

                    # Note: symbolic link with relative path on macOS (ln -s ../some_dir/file file)
                    # ln -s ../../Pods/Local Podspecs/MyPod.podspec.json Pods/AdyenCSE/MyPod.podspec.json
                    File.symlink("../../" + podspec_json_original_path.to_s, podspec_json_dest_path.to_s)

                    # 3. Using :path => 'Pods/MyPod'
                    args.last[:path] = pod_source_path.to_s

                    # 4. Removing :git / :tag / :branch settings
                    args.last.delete(:git)
                    args.last.delete(:tag)
                    args.last.delete(:branch)
                    args.last.delete(:commit)

                    # PS: I don't know whether it's necessary for svn users
                    # args.last.delete(:svn)
                end

                # 5. Calling original pod method
                pod_method.bind(self).(name, *args)
            end
        end
    end
end
