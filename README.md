doms-baseObjectIngest
=====================

These are the scripts for creating all our content models, templates and licenses.

To create all objects in a clean DOMS system, run the script

* `createAll.sh`

To update objects with changes since the previous release of doms-baseObjectIngest, run the scripts

* `createAll.sh`
* `update-` _versionnumber_ `.sh` (for all version numbers between what is currently installed and this version)
* `rebuildupdatetracker.sh` (unless you _KNOW_ the views haven't changed)

How to define new objects
-------------------------

In the directory `src/main/resources/datamodel/` _collectionname_ `/`

 * Make a directory with the same name as the object PID
 * Make a subdirectory `datastreams` with the contents of each datastream in the object
   * Make sure you do NOT have a `<?xml ?>` declaration at the top, since the contents will be inlined in another XML file
 * Make a file `create.xml` that makes the object, makes it inactive, and adds each datastream in the object
   * don't add contents in the datastreams, except in RELS-EXT, which needs to be valid
 * Make a file `setContent.xml` that makes the object inactive and sets contents of each datastream
   * This is done by setting a placeholder with a property the name " _objectname_ `_` _datastreamname_ `_file` " as the contents
    it will be replaced with the actual contents from the `datastreams` directory in maven
 * Make a file `publish.xml` that sets the object active

In `pom.xml`

 * For each datastream, add the property " _objectname_ `_` _datastreamname_ `_file` " and point it at the file in the `datastreams` directory

If the new objects change view definitions (that is: If the object is a content model, and either the VIEW datastream or the relation "isEntryViewAngleFor" in RELS_EXT is changed), update the `src/main/scripts/rebuildupdatetracker.sh` script to reflect the new content models. 

This description leaves out a lot of details. Make sure you look at an existing object definition, and copy its behaviour.

How to update objects
---------------------

 * Update all the files in `src/main/resources/datamodel/` _collectionname_ `/` _objectname_ `/` as described in the section above.
 * Update `pom.xml` with new properties if you have added new datastreams.

If the updated objects change view definitions (that is: If the object is a content model, and either the VIEW datastream or the relation "isEntryViewAngleFor" in RELS_EXT is changed), update the `src/main/scripts/rebuildupdatetracker.sh` script to reflect the new content models. On installation this script must be run. 

Special case: Deleting a datastream or an object:

 * Make a directory `src/main/resources/datamodelupdates/` _versionnumber_ `/` _collectionname_ `/` _objectname_ `/`
 * Make a new xml file that purges the datastream or object.
 * In `src/main/scripts` make a shellscript called `update-` _versionnumber_ `.sh` (using `create....sh` as template) that calls that file.
 * Remove references to the datastream or object from the `src/main/resources/datamodel/` directory, the files `create.xml` and `setContent.xml`, and from `pom.xml`
 * On the next update, the scripts "`update-` _versionnumber_ `.sh`"  must be run.
 
If the deleted objects change view definitions (that is: If the object is a content model, or the data stream is from a content model and is either the VIEW datastream or the RELS_EXT is changed), update the `src/main/scripts/rebuildupdatetracker.sh` script to reflect the new content models. On installation this script must be run. 
