Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 735F94A19
	for <parisc-linux@lists.parisc-linux.org>; Sat,  3 Feb 2001 00:17:56 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA13032
	for <parisc-linux@puffin.external.hp.com>; Sat, 3 Feb 2001 00:13:45 -0700
Sender: rbrad@mailserv2.iuinc.com
Message-ID: <3A7BB0A0.D478911A@uswest.net>
Date: Sat, 03 Feb 2001 00:17:52 -0700
From: Ryan Bradetich <rbradetich@uswest.net>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] RFC: I/O tree design
List-ID: <linux-parisc.vger.kernel.org>

Hello parisc-linux hackers,

Here is my proposal for phase 2 of the I/O tree for parisc-linux.
This proposal covers the internal structure of the I/O tree itself.
I am not providing a patch at this time, because I want to make
sure the idea is sound before we start discussing the implimentation
details of the patch.

[Note: This proposal is a bit rough and could use some re-working
to  make it flow better, but I would rather spend my time discussing
design ideas and writing code then polishing up the design proposal].




Currently the all the "discovered" devices are either found one of
the three following ways:

    1. Firmware tells us about the device.
    2. Probing in known locations and hoping to find a device.
    3. An architect-ed bus walk.

The previous patch for walking the system bus is my first attempt
at an  bus walk on the system bus.  This design proposal
is independent of the  bus walk patch, but eventually
the  bus walk code will be needed to fill in the
missing nodes in the I/O tree.

Currently all the "discovered" I/O devices are stored in a
fixed size array which contains up to 64 devices.  This fixed
size array has already been established and is known to work,
so this proposal does not attempt to replace the fixed size
array, but instead uses indexes within the struct hp_device
to create the logical I/O tree.

To create the logical I/O tree, three u16 values will be
added to the struct hp_device which will contain the index
into the fixed array for the logical parent, sibling, and
child relationship.  I chose a u16 value over the u8 value
because it allows future expansion of the device array and
I want to reserve the largest value for marking the index
uninitialized. The following relationships are defined
below:

Parent: This index is always set to device controlling the
bus the I/O node exists on.  [Note: Just because Node A parent
is Node B does not require Node B's child to be Node A].
The device controlling the I/O node is always one of these
three components:

    - Central Bus
    - Bus Converter
    - Bus Adapter

The parent index is a quick way to determine which devices
are between the given node and the central bus.

Sibling: This index always points to the next device that
exists on the same bus. [Note: The list of devices is NOT
a doubly linked list.  Use parent->child to start at the
head of the one-way linked list].  The sibling pointers
are useful for performing an action to every device that
exists on a given bus.

Child: This index is only set to a valid node if the
current node is the Central bus, a Bus Converter, or
a Bus adapter.  When this index is set to a valid node,
it points to the head of the sibling list containing all
valid nodes for the given bus.

This proposal also calls for a special "root" node at
index 0 of the device array.  The root node is the starting
point of the I/O tree and does not have a parent, nor any
siblings.  The root node has a single child pointer which
points to the head of the sibling list for the system
bus.  Existing code needs to be modified that uses the
device array to ignore the element at index 0 unless it
is using the the device array as a logical I/O tree.

Here is a sample ASCII drawing of a theoretical I/O tree
as envisioned by this proposal.  I have taken care to
make sure the pointer relationship by using arrows to
point the directions the pointers are valid for.

+------+
| Root |<- - - -+
+------+        |
  /|\
   |            |
   |
  \|/           |
+------+     +------+
| Node |---->| Node |<- - - - - - - - - - +
+------+     +------+<- - - -+            |
  /|\          /|\
   |            |            |            |
   |            |
  \|/          \|/           |            |
+------+     +------+     +------+     +------+
| Node |     | Node |---->| Node |---->| Node |
+------+     +------+     +------+     +------+


Summary:

This phase of the I/O tree design is just to make sure
the I/O tree design itself is sound.  I will need to add
three u16 values into struct hp_device to logically the
tree in the device array.  This design proposal does not
include how to initialize and setup the parent, sibling,
and child pointers once they have been added to the
struct hp_device, nor does it cover any additional fields
that may have to be added to logically connect the devices
to form the I/O tree.  I wanted to make sure the I/O tree
design was sound before I started designing how to initialize
the tree from the given devices.

Any feedback, comments, questions, etc is greatly appreciated.

Thanks,

- Ryan
