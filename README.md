# Navigate for CommandBox

Navigate allows you to traverse previouslly viewed working directories, both backwards and forwards (much like a web browser).

## Installation:

Install navigate using commandbox:

```bash
CommandBox> install commandbox-navigate
```

## Options:
**historyMax** *(default: 25)* - Set the maximum amount of retained history.
```bash
CommandBox> set modules.commandbox-navigate.historyMax = 25
```

## Navigate History - *list existing history*

```bash
CommandBox> navigate history
CommandBox> history
```

## Navigate Back (<) - *set the working directory to one previously viewed*
**step** *(optional)* - Number of steps to go back in history.
```bash
CommandBox> navigate back
CommandBox> navigate back 2
CommandBox> navigate <
CommandBox> back
```

## Navigate Forward (>) - *set the working directory to one previously viewed*
**step** *(optional)* - Number of steps to go forward in history.

```bash
CommandBox> navigate forward
CommandBox> navigate forward 2
CommandBox> navigate >
CommandBox> fwd
```

## Navigate Clear - *delete all history*

```bash
CommandBox> navigate clear
```