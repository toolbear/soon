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
