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

Connect the phone and computer to the same Wi-Fi, then run the script above. In a second PowerShell window, run `ipconfig | findstr /i "IPv4"`; open the matching Wi-Fi address with port 8080 on the phone, for example `http://192.168.1.25:8080/`. If Windows asks, allow PowerShell access on **Private networks** only.

## Included in the prototype

- Pupil profiles, learning preferences, and protected support history.
- Twelve school subjects with teacher-managed chapters and grade entry.
- Identification of chapters below the target grade, with tailored support ideas.
- Accessibility adaptations including read-aloud support and visual or written alternatives.
- An Albanian pedagogical-support assistant for teacher discussions.

The prototype keeps its demonstration data in the browser’s local storage.

## Change log

### 2026-07-11

- Refreshed the parent **Rezultati** view with matching pastel result cards and added a subject-by-subject progress card showing visual rise/support indicators and progress tracks.
- Simplified the teacher's **Sot** view by removing the voice-help controls, automated notice, current-result card, resource card and current-task card; those teaching details remain available in their relevant sections.
- Added Era Kola's supplied, cropped PIA PDF to the app. Selecting the PIA card opens only the saved document pages, while the objective, adaptation and progress-measurement values remain blank until they are completed from the plan.
- Redesigned **Vlerësimi përfundimtar** folders to open a dedicated pupil analytics view, removing the empty selection slot. Each view includes a scannable PIA card and a subject report for the logged-in teacher with a line chart and topic-level indicators.
- Updated the pedagogical assistant response flow: each teacher message now starts directly from the reported behavior, varies wording between turns, provides three immediate classroom tactics and exactly three context-sensitive bracketed follow-up tags; safety-risk wording routes to the school's protection and emergency protocol.
- Added direct recognition of task-completion frustration, with classroom actions for task chunking, a nearby worked example and supported first-step validation.
- Reframed the pedagogical assistant as a fast classroom-reaction tool: it now asks for the immediate situation and moves straight to concrete actions rather than a supportive conversational introduction.
- Tightened assistant replies to strip conversational lead-ins before display, keeping the immediate one-sentence behavior analysis, three micro-interventions and exactly three action tags.
- Labeled each assistant tactic list as **Veprimi i mësimdhënësit** so the immediate classroom steps are unmistakable.
- Redesigned **Mbështetja** as a premium pedagogical AI conversation: student identity row, assistant avatar, refined chat bubbles, visual quick prompts, microphone control and a soft-amber emergency note.
- Made the teacher's **Historiku** open the same monthly mood calendar and comment-summary panel used in the parent portal.
- Expanded the teacher's **Sot** experience into a holistic pupil workspace with soft mint, coral and peach surfaces, a circular result indicator, assistive support actions and an interactive current-task card with audio and start controls.
- Added a premium responsive teacher selected-pupil dashboard: a mint-to-peach glass layout keeps a single scrolling column, showing the pupil profile and mood first, followed by learning preferences and readable result-progress cards, with fixed bottom navigation and a mood-history control.
- Reworked the parent's **Historiku** into a slide-in monthly mood history panel with emoji calendar cells for reported moods and date numbers for days without a report, date-stamped parent comments and a close control; the parent bottom navigation now remains fixed while the page scrolls.
- Redesigned the parent sign-in screen with a premium lavender-and-seafoam glass treatment, a satin-gold P emblem, modern fields and a password-visibility control.
- Redesigned the teacher sign-in screen with a premium lavender-and-blue glass treatment, a raised M emblem, modern input fields, and a password-visibility control.
- Redesigned the access-selection screen with a premium pastel-glass presentation, stronger type hierarchy, a floating rounded panel, custom teacher and parent SVG icons, and an accessible purple hover/focus treatment.
- Updated chapter grading so new grades are combined with prior grades and each chapter displays its calculated average.
- Reduced **Mbështetja** to the pedagogical assistant alone, hiding the preference and result sections as well.
- Restricted **Mbështetja** to the contextual content up to the pedagogical assistant, hiding all later page sections.
- Updated the teacher's large mood display to use the same Twemoji icons as the parent mood selection.
- Redesigned the parent's daily mood entry as separate mood and comment cards, with a non-scrolling grid of mood icons sourced from Twemoji's CDN.
- Redesigned the teacher's mood card as **Humori**, with large parent-reported emoji, date, parent comment and arrows for browsing recorded previous days.
- Made **Notimi** a dedicated teacher view with a NOTIMI headline, chapters and grade-entry controls, plus a return action to Nxënësit.
- Streamlined **Nxënësit** by removing the pupil-work title, voice help, subject chooser, in-class mood selector and mood-linked resource suggestion. Added a **Notimi** access card for chapters and grade entry.
- Reordered **Sot** so the selected pupil's short profile appears first, followed by the daily mood notice.
- Expanded pupil learning preferences with reading, listening, movement and collaboration; resource suggestions and support methods now adapt to the selected preference as well as the daily mood.
- Simplified the teacher's **Sot** view by moving the pupil-work title, support/individual-plan history, chapters and grade entry to **Nxënësit**.
- Kept **Lëndët** inside the parent's results view, with a **Shiko më shumë** control that expands the 12-subject average list.
- Moved **Humori sot** to the first position in the teacher's selected-pupil work view.
- Added Supabase Auth sign-in for the seeded teacher and parent accounts. The teacher dashboard now reads its assigned subject, pupil, support profile, chapters, grades and daily mood from Supabase; parent mood updates are saved to Supabase.
- Replaced the local server script with a localhost-only version for more reliable browser testing.
- Redesigned the parent area with bottom navigation for **Sot** (daily mood, optional comment and saved history) and **Rezultati** (average and recent chapters). Teachers now see the parent’s daily mood and comment as read-only information for the selected pupil.
- Updated the teacher's **Sot** flow: sign-in now opens only the pupil registry, and selecting a pupil opens a separate pupil-work view without the registry, with a return button.
- Connected the prototype to its Supabase project using the browser-safe publishable key and added a visible connection-status check. The initial schema now includes subject, teacher, pupil, support-profile, chapter, grade and daily-mood tables protected by RLS.
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
