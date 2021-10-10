# simpleTags
Output tags in simple format with the ability to modify separator.

---------

Sampling by DocLister parameters.

### SNIPPET PARAMETERS
* **&id** - document id to get tags from.
* **&tv** - name of the template variable used for setting categories.
* **&delimeter** - delimiter used in the tv.
* **&caseSensitive** - remove tags that are the same word but were written using different cases. 
* **&separator** - character to separate tag links.

### Example Calls:
```[[simpleTags? &tv=`tags`]]```

```[[simpleTags? &tv=`tags` &separator=` | `]]```

```[[simpleTags? &id=`[+id+]` &value=`[+tags+]` &separator=`, `]]```
