# zmeulkit

Zmeul Kit with OTP

## 13 March 2023
- Flutter 3.7.7 upgrade

## 31 May 2022

- Screenshots folder in assets
- Gradle version update to 1.6.21
- SHA1 debug added - https://developers.google.com/android/guides/client-auth?authuser=0
- Firestore rules changet to:
    rules_version = '2';
    service cloud.firestore {
      match /databases/{database}/documents {
        match /{document=**} {
          allow read, write: if
              request.time < timestamp.date(2022, 8, 28);
        }
      }
    }

- FireStore rules changed to:
    rules_version = '2';
    service firebase.storage {
      match /b/{bucket}/o {
        match /{allPaths=**} {
          allow read, write: if request.auth != null;
        }
      }
    }

