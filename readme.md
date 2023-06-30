### Nudging Citations to Software

Here are two reasons why citing software in papers is a net good:

1. Incentivizes Production of High Quality Software: The role of software in enabling and accelerating research cannot be understated. But the incentives for producing software in academia are still very thin partly because many people do not cite the software they use; the currency in academia is still citations.

2. Helps Track Errors: Citing software (especially the precise version of software) makes it easier to track the impact of errors in particular versions of software. [Github dependency graph](https://docs.github.com/en/rest/dependency-graph?apiVersion=2022-11-28) is a good analog for a similar use case in software. (This point is plausibly best addressed using a similar mechanism as the Github Dependency Graph.)

### Why Not Solve Using Citations?

Software graphs can be easily produced if the deployment of each paper is via a docker image or via a Github like system (which seems optimal). But the arc of progress is long and citations are plausibly a good short-term solution.

### How to Nudge Citations to Software?

One reason why researchers may not cite software is because they don't see others doing it. One way to cue that software should be cited is to show a message when the software is loaded or used to cite the software. (Such a message can also serve as a reminder for people who merely forget to cite the software.) For instance, there are more than 1k citations to [stargazer](https://scholar.google.com/citations?user=jRCc4kMAAAAJ&hl=en). It is likely that one of the reasons is that the package produces a message `.onAttach` to remind the user to cite the package. 

## Initial 'Experiments'

* https://github.com/s3alfisc/fwildclusterboot/pull/125
* https://github.com/kosukeimai/wru/pull/102

## Plan

* Write software to PR a list of R and Python packages on Github with a similar message.

### References

* https://gojiberries.io/2019/03/22/countpy-incentivizing-more-and-better-software/