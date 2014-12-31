<h1 title="soon">🔜</h1>

Soon is the task timer that 💙s developers and optimizes your time for

* shipping meaningful work
* peak performance and recovery
* achieving flow
* mental and physical well being
* hugs & tacos

The only opinion soon has about task or to-do lists is that you should use them. Out of the box soon finds tasks from [Markdown task lists][GFM task lists], feature branches, pull requests, and GitHub issues. Mac users may be interested in the [Reminders][soon-osx-reminders] plugin. Authoring a plugin for your favorite task list manager is straightforward.

On the surface soon has similarities to [a popular technique][pomodoro]. Soon is a tool not a methodology.

[pomodoro]: http://pomodorotechnique.com/ "The Pomodoro Technique®"
[GFM task lists]: https://help.github.com/articles/writing-on-github/#task-lists "GitHub Flavored Markdown Task Lists"
[soon-osx-reminders]: https://github.com/toolbear/soon-osx-reminders "Plugin for Reminders by Apple"

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

4. Install [hub][hub] and alias `git` to `hub`

[hub]: https://hub.github.com "the command-line wrapper for git"
[node]: http://nodejs.org
[oh-my-zsh]: http://ohmyz.sh

### Philosophy and Motivation

The stages of sleep follow a 90-120 minute cycle; research suggests this [pertinent periodicity][ultradian rhythm] persists when we're awake. Our alertness, ability to focus, and energy level rise and fall in time to this rhythm.
Totally different research shows that professional violinists and athletes share similar habits. Top performers practice or train intensely for 90 minutes followed by 15-20 minutes of rest (they also get 8 hours of sleep at night and take naps).

[ultradian rhythm]: http://en.wikipedia.org/wiki/Ultradian_rhythm

Our experience coding in short sessions — 25 minutes long was in vogue — often left us feeling that the break arrived right as things [started flowing][flow]. Increasingly breaks felt like disruptions. We stopped using the timer. In its abscense we coded long past the point of diminshing mental returns; we sat [sedentary for hours at a time][too much sitting]; we forgot to eat. Even the [lazy panda eats][lazy panda eats]!

We were sad pandas.

[flow]: http://en.wikipedia.org/wiki/Flow_(psychology)
[too much sitting]: http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3404815/ "Too Much Sitting: The Population-Health Science of Sedentary Behavior"
[lazy panda eats]: https://www.youtube.com/watch?v=PMgN6-CUoLQ

We want to be happy pandas.

What about longer sessions? Say, 90 minutes long with 15 minute breaks?
Yes, that will do nicely.

We've plenty of tasks already documented in `TODO`. Plus a handful of issues in GitHub and the occasional contributed pull request. Shall we adopt another task list tool solely for task timing?
We shan't.

### Doing Work

1. **Use git**

  Soon relies on `git` to find the root of your current project, determine the current branch, and detect feature branches. It relies on `git` wrapped by [hub][hub] to find pull requests and issues.

2. **Pick an available task. Begin work.**

  Available tasks come in many forms: an [incomplete task][GFM task lists] in `README` or `TODO`; the current branch; local feature branches that are ahead of `master`; an open pull request or open issue. Work how you always have, soon will find them.

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

  Soon starts you off on a 90/15 schedule. This might change over time as soon learns more about you.

  When you begin work on a task soon starts the timer.

  ```console
  $ soon work 'Ride balloon to beehive'
  ★ Ride balloon to beehive
  90 minutes remaining
  ```

  Tasks are as big or as small as you make them. A single task could span several sessions or you could complete several tasks in a single session.

  When you start a task partway through a session soon reports the time remaining.

  ```console
  $ soon work give-eeyore-a-hug
  ⎇ give-eeyore-a-hug
  47 minutes remaining
  ```

  When you resume after a break soon suggests the task you last worked on (unless you completed it). Or you can resume it automatically.

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

  ```console
  $ soon work 'Tiggers != wonderful things'
  You've been working for 92 minutes
  Briefly defer the break (y/N): Y
  ☂ Tiggers != wonderful things
  13 minutes remaining
  ```

  *If you consistently extend your sessions soon will eventually increase the default session duration*

  Sometimes that small task wasn't so small after all.

  ```console
  $ soon work --abort
  Aborted “☂ Tiggers != wonderful things” after 8 minutes
  Take a break
  Come back in about 15 minutes
  ```

4. **Eat when hungry**

  Take your time. There's no late penalty. Soon assumes longer breaks will occur every few sessions even so much as skipping an entire work/rest cycle.

  *If you consistently take longer breaks soon will eventually increase the default break duration*

5. **Take a nap when sleepy**

  No, really.

  Routine siesta taking [lowers your coronary mortality by 37%][siesta for health]; even occasional siesta has benefits. Short naps 10-20 minutes in duration reinvigorate while avoiding waking up with a case of the groggies. REM sleep is associated with mastering complex skills. You go through every stage of sleep, including REM, within 90-110 minutes.

  Unsurprisingly you can substitute lunch+siesta or a long nap for a work/rest cycle.

6. **Ship it! Mark it complete.**

  Ship the thing. Mark it complete in your task management tool. Tell soon you're done.

  ```console
  $ soon work --complete
  Fixed “☂ Tiggers != wonderful things” in 2½ hours (3¼ hours wall-clock)
  75 minutes until your next break

  $ soon work <TAB>
  …
  ```

  When you have plenty of time remaining you can just to begin a new task.

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


## Notifications

Most of the time you're developing and not interacting with soon. This is how it should be. When it's absolutely necessary to get your attention, soon will use a notification.

For notifications to work soon either needs to be running or to be run automatically and frequently. You have a few choices listed below.

Attached to a terminal `soon` will print a notification message along with a `<bell>` character. On OS X, it will also send the message through *Notification Center* (disable with `--no-notification-center`).

1. **Interactive Mode** — run `soon --interactive` in a new terminal. At a minimum this gets you terminal notifications. See [Interactive Mode](#interactive-mode) for the other interactive things you can do.

  ```console
  $ soon --interactive

  # … time passes

  <bell>
  Time for a break
  Come back in about 15 minutes
  ```

2. **launchd on OS X** — the soon `launchd` agent issues *Notification Center* notifications. Install it once.

  ```console
  $ soon launchd >~/Library/LaunchAgents/com.npmjs.package.soon.plist
  $ launchctl -w com.npmjs.package.soon
  ```

3. **Grunt (experimental)** — If you use [Grunt][gruntjs] you can try the [grunt plugin](https://www.npmjs.com/package/grunt-soon). Let us know anything out of the ordinary. If it turns you purple, that is normal.

4. **zsh prompt (experimental)** — [Oh-My-Zsh][oh-my-zsh] users with the `soon` plugin enabled can turn on the soon prompt widget. Using solely this method you will only get timely notifications with near constant command-line use. The experiment is whether this is an effective way to use soon.

5. **tmux** — tmux status bar with a doodad representing the current task type and a countdown timer. Best in conjunction with `soon --interactive` in another pane or window. Will trigger *Notification Center* messages on OS X; if you're SSH'ing into a Mac Mini in the cloud you probably want `--no-notification-center`.

[gruntjs]: http://gruntjs.com

## Interactive Mode

* status bar showing current task and work/break timer
* automatic notifications
* `soon` command prompt with tab completion

```console
$ soon --interactive
>  ls
☂ Tiggers != wonderful things
★ Ride balloon to beehive

> ls --pull-request
★ Ride balloon to beehive

> work give<TAB>
> work give-eeyore-a-hug
⎇ give-eeyore-a-hug
47 minutes remaining
```

## TODO

* [x] write the README first
* [ ] find task lists in README
* [ ] find task lists in TODO
* [ ] move these tasks to TODO.md
