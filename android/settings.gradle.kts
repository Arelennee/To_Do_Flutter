pluginManagement {
    val flutterSdkPath: String = run {
        val props = java.util.Properties()
        file(rootDir.resolve("local.properties"))
            .inputStream().use { stream -> props.load(stream) }
        props.getProperty("flutter.sdk")
            ?: error("flutter.sdk no está definido en local.properties")
    }

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

plugins {
    id("dev.flutter.flutter-plugin-loader") version "1.0.0"
    id("com.android.application") version "8.10.0" apply false
    id("org.jetbrains.kotlin.android")  version "2.1.0" apply false
    id("com.google.gms.google-services") version "4.4.1" apply false
}

include(":app")
