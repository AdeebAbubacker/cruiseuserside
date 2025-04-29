# OTP Library ProGuard Rules
-keep class com.shivam.otp_pin_field.** { *; }
-dontwarn com.shivam.otp_pin_field.**
# Razorpay ProGuard Rules
-keep class com.razorpay.** { *; }
-dontwarn com.razorpay.**
-keep class proguard.annotation.** { *; }
-keepclassmembers class * {
    @proguard.annotation.Keep *;
    @proguard.annotation.KeepClassMembers *;
}