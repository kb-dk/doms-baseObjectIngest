doms-baseObjectIngest
=====================

These are the scripts for creating all our content models, templates and licenses.

To create all objects in a clean DOMS system, run the script

* `createAll.sh`

To update objects with changes since the previous release of doms-baseObjectIngest, run the scripts

* `migrate-` _versionnumber_ `.sh` (for all version numbers between what is currently installed and this version)
* `updateAll.sh`
* `rebuildupdatetracker.sh` (unless you _KNOW_ the views haven't changed - make a note in CHANGELOG)

<!-- TODO It would be a good idea to store the version number of the last base objects ingester in DOMS, and make logic for using that object to select creation or correct migrations -->

How to update objects
---------------------

 * Update all the files in `src/main/resources/datamodel/` _collectionname_ `/` _objectname_ `/` as described in the section above.
 * Update `pom.xml` with new properties if you have added new datastreams.

If the updated objects change view definitions (that is: If the object is a content model, and either the VIEW datastream or the relation "isEntryViewAngleFor" in RELS_EXT is changed), update the `src/main/scripts/rebuildupdatetracker.sh` script to reflect the new content models. On installation this script must be run. 

How to define new objects or datastreams
----------------------------------------

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

Create migration script

 * Make a directory `src/main/resources/migrate/` _versionnumber_ `/` _collectionname_ `/` _objectname_ `/`
 * Make a new xml file that creates the datastream or object. If it's a new datastream, remember to set the object inactive before adding.
 * In `src/main/scripts` make a shellscript called `migrate-` _versionnumber_ `.sh` (using a previous migration script as template) that calls that file.
 * On the next update, the scripts "`migrate-` _versionnumber_ `.sh`"  must be run.

If the new objects change view definitions (that is: If the object is a content model, and either the VIEW datastream or the relation "isEntryViewAngleFor" in RELS_EXT is changed), update the `src/main/scripts/rebuildupdatetracker.sh` script to reflect the new content models. 

This description leaves out a lot of details. Make sure you look at an existing object definition, and copy its behaviour.

How to delete objects or datastreams
------------------------------------

 * Remove references to the datastream or object from the `src/main/resources/datamodel/` directory, the files `create.xml` and `setContent.xml`, and from `pom.xml`

Create migration script

 * Make a directory `src/main/resources/migrate/` _versionnumber_ `/` _collectionname_ `/` _objectname_ `/`
 * Make a new xml file that purges the datastream or object. Remember to set the object inactive first (or deleted, if you delete the object afterwards).
 * In `src/main/scripts` make a shellscript called `migrate-` _versionnumber_ `.sh` (using `create....sh` as template) that calls that file.
 * On the next update, the scripts "`migrate-` _versionnumber_ `.sh`"  must be run.
 
If the deleted objects change view definitions (that is: If the object is a content model, or the data stream is from a content model and is either the VIEW datastream or the RELS_EXT is changed), update the `src/main/scripts/rebuildupdatetracker.sh` script to reflect the new content models. On installation this script must be run. 
