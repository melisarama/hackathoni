# Vlerësimi i Nxënësit

Mobile-first prototype for teachers to track learning progress and receive accessibility-aware support for individual pupils.

## Product idea

Mësim i Qartë helps teachers follow each pupil’s learning outcomes over time. Each pupil has an individual profile with learning preferences and authorised support information. Teachers can add subjects, chapters and grades, then receive practical learning suggestions in Albanian that account for the pupil’s profile. A dedicated pedagogical-support area provides a safe discussion space for teachers to reflect on classroom challenges; it is not a diagnostic or emergency service.

## Run locally

```powershell
powershell -ExecutionPolicy Bypass -File .\start-localhost.ps1
```

Open [http://localhost:8080](http://localhost:8080).

### Test on a phone

Connect the phone and computer to the same Wi-Fi, then run the script above. It prints a local network URL such as `http://192.168.1.25:8080/`; open that address on the phone. If Windows asks, allow PowerShell access on **Private networks** only.

## Included in the prototype

- Pupil profiles, learning preferences, and protected support history.
- Twelve school subjects with teacher-managed chapters and grade entry.
- Identification of chapters below the target grade, with tailored support ideas.
- Accessibility adaptations including read-aloud support and visual or written alternatives.
- An Albanian pedagogical-support assistant for teacher discussions.

The prototype keeps its demonstration data in the browser’s local storage.

## Change log

### 2026-07-11

- Added a teacher sign-in form for first name, last name, assigned subject and a prototype 10-digit personal ID. The teacher dashboard now displays only the selected subject.
- Added a top-level back arrow in the teacher dashboard to return to the access-choice screen.
- Added a parent entry flow that requires a selected pupil and a prototype personal-ID verification step; production use requires secure server-side authentication.
- Added a role-selection entry screen: teachers open the existing dashboard, while parents enter a placeholder area for the next phase.
- Replaced **Sugjerime** with **Vlerësimi përfundimtar**, including a folder for each pupil and continuous-assessment summary.
- Moved **Humori ditor** to the first navigation position and refreshed the navigation with larger, more prominent icons.
- Added distinct pastel colours for each navigation icon to improve scanability.
- Integrated the parent mood update into the **Sot** view as **Humori sot**, rather than a separate navigation item.
- Reordered **Sot** so the pupil registry appears first, followed by the selected pupil’s profile and parent-provided mood notice.
- Updated **Humori sot** to display and edit only the currently selected pupil’s parent notification.
- Linked the in-class mood prompt to the selected pupil and their parent-provided daily mood.
- Enabled local Wi-Fi testing by having the development server listen on the computer’s active IPv4 address.
- Audited and strengthened text colours to meet WCAG 2.1 AA contrast requirements for normal-sized text.
- Added **Humori ditor**, where parent-provided mood and brief daily comments can be reviewed for every pupil.
- Restored the full teaching workflow for the **Sot** and **Nxënësit** views.
- Kept **Mbështetja** focused on the pupil profile, current result and pedagogical AI assistant.
- Added a current-result summary that highlights chapters below target and proposes profile-aware support methods.
- Added local pupil registry, preferences, accessibility support, chapters, grades and Albanian pedagogical-assistant interactions.
