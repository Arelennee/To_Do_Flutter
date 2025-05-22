import org.gradle.api.tasks.Delete
import org.gradle.api.file.Directory

buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath ("com.android.tools.build:gradle:8.1.0")
        classpath ("org.jetbrains.kotlin:kotlin-gradle-plugin:1.8.21")
        classpath ("com.google.gms:google-services:4.3.15")
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Personaliza el directorio de build si lo necesitas (opcional)
val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)

    // Asegura evaluación del módulo app antes
    project.evaluationDependsOn(":app")
}

// Comando clean de Gradle
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
