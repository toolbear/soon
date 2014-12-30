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
