<h1 title="Soon — the task timer that loves developers">🔜 — the task timer that 💙s developers</h1>

Soon is a task timer with opinions on how to optimize your development time for:

* completing meaningful work
* peak performance and recovery
* achieving flow
* mental and physical well being
* hugs & tacos

The only opinion Soon has about task or to-do lists is that you should use them.

Out of the box Soon finds tasks from [GFM task lists][GFM task lists], git feature branches, GitHub pull requests, and GitHub issues. Mac users may be interested in plugins for [Reminders][soon-osx-reminders] or [Things][soon-things]. Authoring a plugin for your favorite task list manager is straightforward.

On the surface Soon has similarities to [a popular technique][pomodoro]. Our scope is smaller and our approach different; Soon is a tool not a methodology.

[pomodoro]: http://pomodorotechnique.com/ "The Pomodoro Technique®"
[GFM task lists]: https://help.github.com/articles/writing-on-github/#task-lists "GitHub Flavored Markdown Task Lists"
[soon-osx-reminders]: https://github.com/toolbear/soon-osx-reminders "Plugin for Reminders by Apple"
[soon-things]: https://github.com/toolbear/soon-things "Plugin for Things by Cultered Code"

## Teaser

```markdown
# TODO.md

* [x] Bathe Piglet
* [ ] Tea and honey
```
```console
$ soon work <TAB>
$ soon work Tea\ and\ honey⏎
✓ Tea and honey
90 minutes remaining

# …eventually
```
```markdown
* [x] Tea and honey
```
```console
$ soon work --complete⏎
Completed “✓ Tea and honey” in 1¼ hours
13 minutes until your next break

$ soon work <TAB>
🎉 You did all the things 🎉
13 minutes until your next break

$ soon ls --completed⏎
✓ Bathe Piglet
✓ Tea and honey
★ The Sport of Poohsticks
☂ Tiggers != wonderful things
★ Ride balloon to beehive
12 minutes until your next break
```

## Using Soon for Great Success

### Getting Started

1. Install [Node.js][node]
2. Install `soon` globally
  ```console
  $ sudo npm install -g soon
  ```
3. Run `. <(soon completion)` to enable tab completion for your current shell.
  [Oh-My-Zsh][oh-my-zsh] users should enable the `soon` plugin.
  ```zsh
  plugins=(git osx terminalapp soon)
  ```
  Everyone else should add the following to `~/.bashrc` or `~/.zshrc`.
  ```console
  . <(soon completion)
  ```

[node]: http://nodejs.org
[oh-my-zsh]: http://ohmyz.sh

### Philosophy and Motivation

The stages of sleep follow a 90-120 minute cycle and research suggests this [pertinent periodicity][ultradian rhythm] persists when we're awake; our alertness, ability to focus, and energy level rise and fall in time. Totally different research showed that professional violinists and athletes have similar schedules; the top performers practiced or trained intensely for 90 minutes followed by 15-20 minutes of rest (they also slept 8 hours a night and took a short nap during the day).

[ultradian rhythm]: http://en.wikipedia.org/wiki/Ultradian_rhythm

Our experience coding in short sessions — 25 minutes long — often left us feeling that the break arrived right as things [started flowing][flow]. Increasingly breaks felt like disruptions. We stopped using the timer. In its abscense we coded long past the point of diminshing mental returns; we sat [sedentary for hours at a time][too much sitting]; we forgot to eat. Even the [lazy panda eats][lazy panda eats]! We were sad pandas.

[flow]: http://en.wikipedia.org/wiki/Flow_(psychology)
[too much sitting]: http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3404815/ "Too Much Sitting: The Population-Health Science of Sedentary Behavior"
[lazy panda eats]: https://www.youtube.com/watch?v=PMgN6-CUoLQ

What about longer sessions? Say, 90 minutes long with 15 minute breaks? Yes, that will do nicely.

We've plenty of tasks documented in `TODO.md` already. Plus a handful of issues in GitHub and the occasional contributed pull request. Shall we skip tracking those in a second place? We shall.

We'll revisit sleep in a little bit.

### Doing Work

1. **Use git**

  Soon relies on `git` to find the root of your current project.

2. **Pick an available task. Begin work.**

  Available tasks come in many forms: an [incomplete task][GFM task lists] in `README` or `TODO`; the current branch; local feature branches that are ahead of `master`; an open pull request or open issue. Work how you always have, Soon will find them.

  Use `soon ls` to list available tasks for the current project, optionally filtering by type (e.g. `--pull-request` or `--todo`).

  ```console
  $ soon ls
  ☂ Tiggers != wonderful things
  ★ Ride balloon to beehive

  $ git checkout -b give-eeyore-a-hug
  Switched to a new branch 'give-eeyore-a-hug'
  $ soon ls
  ⎇ give-eeyore-a-hug
  ☂ Tiggers != wonderful things
  ★ Ride balloon to beehive

  $ soon ls --issue
  ☂ Tiggers != wonderful things
  ```

  Indicate that you've started a task with `soon work TASK`.

  ```console
  $ soon work 'Ride balloon to beehive'
  ```

  The task description must match an available task. Tab completion is your friend.

  ```console
  $ soon work give<TAB>
  $ soon work give-eeyore-a-hug

  $ soon work 'Ride<TAB>
  $ soon work 'Ride balloon to beehive'

  $ soon work <TAB>
  ⎇ give-eeyore-a-hug
  ☂ Tiggers != wonderful things
  ★ Ride balloon to beehive
  ```

  The same type filters as with `soon ls` can be used.

  ```console
  $ soon work --issue '<TAB>
  $ soon work --issue 'Tiggers != wonderful things'
  ```

  Tab completion is context aware and super smart so you can get on with actual work.

3. **Develop for 90 minutes. Relax for 15. Repeat.**

  Soon starts you off on a 90/15 schedule. This might change over time as Soon learns more about you.

  When you begin work on a task Soon starts the timer.

  ```console
  $ soon work 'Ride balloon to beehive'
  ★ Ride balloon to beehive
  90 minutes remaining
  ```

  Tasks are as big or as small as you make them. A single task could span several sessions or you could complete several tasks in a single session.

  When you start a task partway through a session Soon reports the time remaining.

  ```console
  $ soon work give-eeyore-a-hug
  ⎇ give-eeyore-a-hug
  47 minutes remaining
  ```

  When you resume after a break Soon suggests the task you last worked on (unless you completed it). Or you can resume it automatically.

  ```console
  $ soon work <TAB>
  Current task
    ⎇ give-eeyore-a-hug
  Available tasks
    ⎇ give-eeyore-a-hug
    ☂ Tiggers != wonderful things
    ★ Ride balloon to beehive

  $ soon work --continue
  You rested for 32 minutes
  ⎇ give-eeyore-a-hug
  90 minutes remaining
  ```

  Sometimes the session is over but you have one small thing remaining.

  *If you consistently extend your sessions Soon will eventually increase the session duration*

  ```console
  $ soon work 'Tiggers != wonderful things'
  You've been working for 92 minutes
  Briefly defer the break (y/N): Y
  ☂ Tiggers != wonderful things
  13 minutes remaining
  ```

  Sometimes that small task wasn't so small after all.

  ```console
  $ soon work --abort
  Aborted “☂ Tiggers != wonderful things” after 8 minutes
  Take a break
  Come back in about 15 minutes
  ```

4. **Eat when hungry**

  Take your time. There's no late penalty. Soon assumes longer breaks will occur every few sessions even so much as skipping an entire work/rest cycle.

  *If you consistently take longer breaks Soon will eventually increase the break duration*

5. **Take a nap when sleepy**

  No, really.

  Routine siesta taking [lowers your coronary mortality by 37%][siesta for health]; even occasional siesta has benefits. Short naps 10-20 minutes in duration reinvigorate while avoiding waking up with a case of the groggies. REM sleep is associated with mastering complex skills. You go through every stage of sleep within 90-110 minutes.

  Unsurprisingly you can substitute lunch+siesta or one longer nap for a work/rest cycle.

6. **Ship it! Mark it complete.**

  Ship the thing. Mark it complete in your task management tool. Tell Soon you're done. In that order.

  ```console
  $ soon work --complete
  Fixed “☂ Tiggers != wonderful things” in 2½ hours (3¼ hours wall-clock)
  75 minutes until your next break

  $ soon work <TAB>
  …
  ```

  When you know that you have plenty of time remaining you can just to begin a new task. Soon does the right things.

  ```console
  $ soon work Ride<TAB>
  $ soon work Ride\ balloon\ to\ beehive
  Fixed “☂ Tiggers != wonderful things” in 2½ hours (3¼ hours wall-clock)
  ★ Ride balloon to beehive
  75 minutes remaining
  ```

7. **Do it again or stop for now**

  That.

[siesta for health]: http://www.ncbi.nlm.nih.gov/pubmed/17296887
