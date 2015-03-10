doms-baseObjectIngest
=====================

These are the scripts for creating all our content models, templates and licenses.

To create all objects in a clean DOMS system, run the script

    createAll.sh

To update objects with changes since the previous release of doms-baseObjectIngest, run the script

    updateAll.sh

How to define new objects
-------------------------

In the directory `src/main/resources/datamodel/` _collectionname_ `/`

 * Make a directory with the same name as the object PID
 * Make a subdirectory `datastreams` with the contents of each datastream in the object
   * Make sure you do NOT have a `<?xml ?>` declaration at the top, sionce the contents will be inlined in another XML file
 * Make a file `create.xml` that makes the object, makes it inactive, and adds each datastream in the object
   * don't add contents in the datastreams, except in RELS-EXT, which needs to be valid
 * Make a file `setContent.xml` that makes the object inactive and sets contents of each datastream
   * This is done by setting a placeholder with a property the name " _objectname_ `_` _datastreamname_ `_file` " as the contents
    it will be replaced with the actual contents from the `datastreams` directory in maven
 * Make a file `publish.xml` that sets the object active

In `pom.xml`

 * For each datastream, add the property " _objectname_ `_` _datastreamname_ `_file` " and point it at the file in the `datastreams` directory

In the file `update` _collectionname_ `objects.sh`

 * Add your new object as described in the file.
 * After next release, remove this, as it is now part of the base installation.

This description leaves out a lot of details. Make sure you look at an existing object definition, and copy its behaviour.

How to update objects
---------------------

 * Update all the files in `src/main/resources/datamodel/` _collectionname_ `/` _objectname_ `/` as described in the section above.
 * Update `pom.xml` with new properties if you have added new datastreams.
 * Update `update` _collectionname_ `objects.sh` as descibed in the file.
 * After release, remove what you have added to `update` _collectionname_ `objects.sh`

Special case: Deleting a datastream:

 * Make a new xml file that purges the datastream.
 * Add a reference to that file from `update` _collectionname_ `objects.sh`.
 * Remove references to the datastream from the `datastreams` directory, the files `create.xml` and `setContent.xml`, and from `pom.xml`
 * After release remove the xml file and the reference in the `update` _collectionname_ `objects.sh`.

Special case: Deleting an object

 * Replace the entire contents of `src/main/resources/datamodel/` _collectionname_ `/` _objectname_ `/` with an xml file that removes the object.
 * Remove references to the object from `pom.xml`
 * Add a reference to that file from `update` _collectionname_ `objects.sh`.
 * After release remove the xml file and the reference in the `update` _collectionname_ `objects.sh`.

