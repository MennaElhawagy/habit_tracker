# 1 - Registration

# User Story Template
**Title:**
Account registration
_As a user, I want to register with my name, username, password, age, and country so that I can create an account and access the habit tracking features._
**Acceptance Criteria:**
1. Registration form has fields: name, username, password, age, and country (all required).
2. Form validates empty fields; shows clear error messages.
3. Successful submit creates the account and leads to the home screen.
**Priority:** High
**Story Points:** 3
**Notes:**
- Keep messages short and clear.

# 2 - Login
# User Story Template
**Title:**
Account login
_As a user, I want to log in using my username and password so that I can access my account and track my habits._
**Acceptance Criteria:**
1. Login requires username and password; both fields validated for emptiness.
2. On success, user lands on the home screen.
3. On failure, user sees a simple “ِِAll fields are required” message.
**Priority:** High
**Story Points:** 3
**Notes:**
- NA.

# User Story Template
**Title:**
Error feedback on login
_As a user, I want to receive a message if I enter the wrong username or password so that I know my login attempt was unsuccessful._
**Acceptance Criteria:**
1. Wrong username or password shows one concise alert above the form.
2. The alert hides after correction or after a short timeout.
3. No technical details are exposed in messages.
**Priority:** High
**Story Points:** 2
**Notes:**
- Use simple language; avoid jargon.

# 3 — Homepage

# User Story Template
**Title:**
View welcome message
_As a user, I want to see a personalized welcome message with my name on the homepage, so that I feel recognized and can confirm I am logged into the correct account._
**Acceptance Criteria:**
1. Header shows “{name}”.
2. Name updates after profile name changes.
**Priority:** Medium
**Story Points:** 2
**Notes:**
- Support long names gracefully.

# User Story Template
**Title:**
Display weekly progress
_As a user, I want to see my daily progress for each habit on the homepage, so that I can easily monitor my progress._
**Acceptance Criteria:**
1. Weekly view shows each day’s completion per habit.
2. Today’s status is highlighted.
3. Empty state explains how to add a habit.
**Priority:** High
**Story Points:** 3
**Notes:**
- NA

# User Story Template
**Title:**
View completed habits
_As a user, I want to see a section for completed habits on the homepage, so that I can track what I have already achieved._
**Acceptance Criteria:**
Completed habits appear in a separate list/section.
**Priority:** Medium
**Story Points:** 2
**Notes:**
- Allow quick navigation to habit details.

# Exercise 4 — Menu

# User Story Template
**Title:**
Access menu options
_As a user, I want to access a menu with options for configuring my habits, viewing reports, editing my profile, and signing out, so that I can easily navigate to different parts of the app._
**Acceptance Criteria:**
1. Menu icon visible on home screen.
2. Menu shows: Configure, Profile, Reports, Notifications and Sign out.
3. Selecting an option navigates to the correct page.
**Priority:** High
**Story Points:** 3
**Notes:**
- Preserve the current page state when opening/closing menu.

# User Story Template
**Title:**
Navigate to profile
_As a user, I want to access a menu with options to configure my habits, view reports, edit my profile, configure notifications and sign out, so that I can easily navigate different parts of the app_
**Acceptance Criteria:**
1. “Profile” menu item is present and enabled.
2. Clicking “Profile” opens the profile page.
3. Browser back returns to the previous page.
**Priority:** Medium
**Story Points:** 2
**Notes:**
- Keep menu labels consistent and short.

# User Story Template
**Title:**
Navigate to habits page
_As a user, I want to access the habits page from the menu, so that I can configure and manage my habits._
**Acceptance Criteria:**
1. “Habits” menu item navigates to the habits management page.
2. Page loads existing habits list.
3. Back navigation returns to the last page.
**Priority:** High
**Story Points:** 3
**Notes:**
- NA

# User Story Template
**Title:**
Sign out from menu
_As a user, I want to sign out of my account using an option in the menu, so that I can securely log out when I'm finished using the app._
**Acceptance Criteria:**
1. “Sign out” prompts confirmation.
2. On confirm, session is cleared and user returns to login page.
3. After sign out, protected pages are not accessible.
**Priority:** High
**Story Points:** 2
**Notes:**
- Clear any cached sensitive data.

# 5 — Profile Page

# User Story Template
**Title:**
View personal information
_As a user, I want to view my saved name, username, age, and country on my profile page, so that I can see the details I provided during registration._
**Acceptance Criteria:**
1. Profile page displays name, username, age, and country.
2. Data matches the stored registration values.
3. If data is missing, show a helpful placeholder.
**Priority:** Medium
**Story Points:** 2
**Notes:**
- Protect sensitive fields from accidental edits.

# User Story Template
**Title:**
Edit personal information
_As a user, I want to update my name, username, age, and country on my profile page, so that I can keep my information up to date._
**Acceptance Criteria:**
1. “Edit” enables form fields for name, username, age, country.
2. Validation prevents empty or invalid age.
3. “Save” updates data and returns to view mode.
**Priority:** High
**Story Points:** 3
**Notes:**
- Confirm before discarding unsaved changes.

# User Story Template
**Title:**
Update name in header
_As a user, I want my updated name to be displayed in the app's header after I change it in the profile, so that my changes are immediately visible._
**Acceptance Criteria:**
Header updates instantly after name is saved.
**Priority:** Medium
**Story Points:** 2
**Notes:**
- NA

# 6 — Habits Page

# User Story Template
**Title:**
Add a new habit
_As a user, I want to add new habits on the details configuration page so that I can manage and update my habits as needed._
**Acceptance Criteria:**
1. “Add habit” opens a form with name and optional description/color.
2. On save, the new habit appears in the list.
**Priority:** High
**Story Points:** 3
**Notes:**
- Prevent duplicate habit names where possible.

# User Story Template
**Title:**
Delete a habit
_As a user, I want to delete existing habits so that I can keep my habits up to date._
**Acceptance Criteria:**
1. Each habit has a delete option.
2. On delete, the habit is removed from the list.
**Priority:** Medium
**Story Points:** 2
**Notes:**
- Consider soft delete with undo for a few seconds.

# User Story Template
**Title:**
Personalize a habit with color
_As a user, I want to assign a specific color to each habit to make it personal to me._
**Acceptance Criteria:**
1. Habit add form includes a color picker.
2. Selected color appears in lists and charts.
3. Color choice persists after app restart.
**Priority:** Low
**Story Points:** 2
**Notes:**
- Ensure good contrast/accessibility.

# 7 — Reports Page

# User Story Template
**Title:**
View weekly reports
_As a user, I want to see a report of my weekly habit progress so that I can understand how well I am maintaining my habits._
**Acceptance Criteria:**
1. Weekly report shows completion per day for each habit.
2. Includes totals and weekly completion rate.
3. Empty state explains how to start tracking.
**Priority:** High
**Story Points:** 3
**Notes:**
- Keep data readable on small screens.

# User Story Template
**Title:**
Visualize completed habits
_As a user, I want to see a chart of my completed habits for each day of the week so that I can quickly identify trends in my progress._
**Acceptance Criteria:**
Chart displays daily completed counts.
**Priority:** Medium
**Story Points:** 2
**Notes:**
- Neat look.

# User Story Template
**Title:**
View all habits
_As a user, I want to see both completed and incomplete habits in my report so that I have a comprehensive view of my habit tracking performance._
**Acceptance Criteria:**
1. Report lists both completed and incomplete counts per day.
**Priority:** Medium
**Story Points:** 3
**Notes:**
- Persist last-used filter.

# 8 — Notifications Page

# User Story Template
**Title:**
Enable/disable notifications
_As a user, I want to be able to enable or disable notifications for the app, so that I can choose whether or not to receive reminders for my habits._
**Acceptance Criteria:**
1. Global toggle turns reminders on/off.
2. When off, no reminders are delivered.
3. UI indicates current notification status.
**Priority:** Medium
**Story Points:** 2
**Notes:**
- NA.

# User Story Template
**Title:**
Add habits for notifications
_As a user, I want to select specific habits to receive notifications for, so that I only get reminders for the habits I am actively working on._
**Acceptance Criteria:**
1. Multi-select list of habits for reminders.
2. Selected habits clearly shown and saved.
**Priority:** Medium
**Story Points:** 3
**Notes:**
- NA.

# User Story Template
**Title:**
Set notification times
_As a user, I want to have the option to receive notifications three times a day (morning, afternoon, evening) for all selected habits, so that I get timely reminders throughout the day to complete my habits._
**Acceptance Criteria:**
1. User can set times for morning, afternoon, and evening.
2. Reminders send at the chosen times for selected habits.
3. Snooze or dismiss options available on receipt.
**Priority:** Medium
**Story Points:** 3
**Notes:**
- NA.
