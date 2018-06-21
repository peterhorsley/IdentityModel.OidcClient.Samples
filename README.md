# Samples for IdentityModel.OidcClient

All samples use a demo instance of identityserver (https://demo.identityserver.io) - you can see the source code [here](https://github.com/IdentityServer/IdentityServer4.Demo).

You can login with `alice/alice` or `bob/bob`

# Unity sample notes:

* Ensure your Unity project's .NET version is set to 4.x in player settings.
* Unity does not support nuget nicely, so you must clone and compile IdentityModel.OidcClient2 solution using Visual Studio 2017.
* Copy the release binaries from IdentityModel.OidcClient/bin/release/net452 to a folder in your Unity project's Assets folder.
* Delete System.Runtime.InteropServices.RuntimeInformation.dll as this DLL is not compatible with Unity.  
* Import Json.Net.Unity3D package available from https://github.com/SaladLab/Json.Net.Unity3D.
* You must then move Newtonsoft.Json.dll from Assets/UnityPackages/JsonNet/ to the same location as your OidcClient binaries.
* Add link.xml and mcs.rsp files to your Assets folder.

## iOS Support

* Derive an objective-c class from UnityAppController to handle auth redirects (see OAuthUnityAppController.mm).
* Include a class for interacting with SFSafariViewController in Assets/Plugins/iOS (see SafariView.mm).
* In Unity, select SafariView.mm in Project view, and in Inspector pane, under 'Rarely used services' select 'SafariServices'.

## Android Support

* Import the Google Play Services Resolver for Unity package from https://github.com/googlesamples/unity-jar-resolver
 (currently play-services-resolver-1.2.72.0.unitypackage)
* Add ResolveDependencies.cs to /Assets/PlayServicesResolver/Editor/ with code to include the android support library.
* In Unity, go to menu Assets -> Play Services Resolver -> Android Resolver -> Resolve Client Jars.
* You should now have customtabs-23.0.0 and support-annotations-23.0.0 in /Assets/Plugins/Android folder.
* Add an Android Unity plugin project to handle auth redirects (see AndroidUnityPlugin project).
* You will need to copy classes.jar from your Unity install folder e.g. C:\Program Files\Unity\Editor\Data\PlaybackEngines\AndroidPlayer\Variations\mono\Release\Classes\classes.jar to AndroidUnityPlugin/app/libs.
* This project contains an activity that handles auth redirects and some build scripts to export the project as a JAR file.
* To build this project, open it in Android Studio and run the 'exportJar' gradle task.  This will produce AndroidUnityPlugin.jar in /Assets/Plugins/Android/ folder.
* Create/modify Assets/Plugins/Android/AndroidManifest.xml to include the OAuthRedirectActivity, ensuring it has the redirect URL specified in the data element's schema attribute.
