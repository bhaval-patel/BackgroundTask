# BackgroundTask

In this iOS tutorial, we are going to understand <a href="https://www.spaceotechnologies.com/ios-background-task-framework-app-update/">how to schedule iOS background tasks</a>. This iOS tutorial is for those who want to implement the background task scheduler in their latest iOS app development project.

## BackgroundTasks Framework

This new framework is used for tasks like cleaning a database, updating a machine learning model, or updating the displayed data for an app, and other deferrable tasks that are better done in the background. It makes efficient use of processing time and power, and run tasks like these when the device is in idle condition.

BackgroundTasks Framework has two main task requests under BGTaskScheduler:
## 1) BGAppRefreshTaskRequest: This is a request to launch an app in the background to execute a short refresh task.

## 2) BGProcessingTaskRequest: This is a request to launch an app in the background and execute a process that takes a longer time to complete.

BackgroundTasks can be used to perform various activities like database cleaning, uploading pictures to a server, syncing pictures in other devices, and many more.

In this iOS tutorial, we are going to take the iOS background task example of fetching the latest count of added images in the image gallery.

Below are the steps to follow in order to implement the above mentioned demo:

1. Create a new project using XCODE 11.
2. Select “Single View App” in the iOS section and enter the project name. (We have kept the project name as “SOBackgroundTask”).
3. Go to SoBackgroundTask Target and click on “Signing & Capabilities”, then click on “+ Capability”
4. Double-tap on “Background Modes”
5. Select “Background Fetch” and “Background Processing” from all background tasks.
6. Add “BGTaskSchedulerPermittedIdentifiers” key in info.plist and add a task identifier array.

## Note: The system only runs the tasks registered with identifiers on a whitelist of task identifiers.

7. import BackgroundTasks in AppDelegate.swift.

8. Create registerBackgroundTaks() method with identifier (use the same identifier we used in info.plist) and call it from Application:didFinishLaunchingWithOptions

9. Create scheduleImagefetcher() and scheduleAppRefresh() method for fetching images from the gallery and refresh app once image fetch is completed. These methods are called from applicationDidEnterBackground.
