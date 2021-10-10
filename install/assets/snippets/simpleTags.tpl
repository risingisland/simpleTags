/**
 * simpleTags
 *
 * Output tags in simple format with the ability to modify separator.
 *
 * @category	snippet
 * @internal	@modx_category Navigation
 * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)
 */

/**
* example    on a page: [[simpleTags? &tv=`tags`]]
* example    on a page: [[simpleTags? &tv=`tags` &separator=` | `]]
* example    ditto tpl: [[simpleTags? &id=`[+id+]` &value=`[+tags+]` &separator=`, `]] with &hiddenFields=`tags` added to the Ditto call
* 
* Parameters:
* &id = document id to get tags from. default is current document.
*       When using this in a ditto tpl, use &id=`[+id+] to get the tags for the document being summarized.
*
* &tv = name of the template variable used for setting categories.
*
* &value = value of the tv if it has already been retrieved
*
* &delimeter = delimiter used in the tv.
*       defaults to a comma ","
*
* &caseSensitive = remove tags that are the same word but were written using different cases. 
* 		defaults to false.
*
* &separator = character to separate tag links.
*       comma (,) or pipe (|) for example.
*       defaults to ' ' (single space).
*
***************************************/

/**
* Set values for items that were not set in the snippet call.
*/
$page_id = isset($id) ? $id : $modx->documentObject['id'];
$tv = isset($tv) ? $tv : '';
$delimiter = isset($delimiter) ? $delimiter : ',';
$separator = isset($separator) ? $separator : ' ';
$caseSensitive = isset($caseSensitive) ? $caseSensitive : 0;


/**
* Get the tags from the TV the user supplied
*/
if ($tv == '' && !isset($value)){return "No template variable for tags was declared.";}
$get_tags = isset($value) ? $value : implode($delimiter,$modx->getTemplateVarOutput($idname=array($tv), $page_id, $published="1"));

/**
* Make an array of all the tags associated with the specified document.
*/
$tags = array();
$tvarray = explode($delimiter, $get_tags);
foreach ($tvarray as $tag) {
	if (!empty($tag)) {
		if ($caseSensitive) {
			$tags[trim($tag)] = trim($tag);
		} else {
				$tags[strtolower(trim($tag))] = trim($tag);
			}
	}
}
$tvarray = array_values($tags);
$cnt = count($tvarray);

/**
* genereate a series of list items
*/
$link .= $nl;
for ($x=0;$x<$cnt;$x++) {
	//$url = urlencode(trim($tvarray[$x]));
	$cnd_separator = ($x!=($cnt-1)) ? $separator : '';
	$link .= ''.trim($tvarray[$x]).''.$cnd_separator.''.$nl;
}
$link .= ''.$nl;


if ($tvarray['0'] == ''){
	return;
}else{

	return $link;
}