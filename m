From: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] A couple of questions
Date: Wed, 12 May 2004 13:27:12 +0100
Message-ID: <20040512122712.GG6278@parcelfarce.linux.theplanet.co.uk>
References: <000a01c437a4$c0d70de0$6401a8c0@nwoods>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Nathaniel Woods <nwoods29321@chater.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <000a01c437a4$c0d70de0$6401a8c0@nwoods>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, May 11, 2004 at 06:10:04PM -0400, Nathaniel Woods wrote:
> First off,  I am using an HP 9000/720.
> 2. When trying to access the floppy (which is at /dev/sda) the system
> crashes. How do I fix this?

By sending us the messages ;-)

> 3. There is a built in audio port. How do I configure it?

Is there?  I don't see one listed in the device inventory at
http://hwdb.parisc-linux.org/view.php3?type=machine&name=720

We currently know about 5 kinds of audio on PA machines.  Most older
machines have Harmony (sversion 0x0007B).  The 705 and 710 have a
different audio chip (sversion 0x0007A).  The 745i and 747i have another
(sversion 0x0007E) and the 735 and 755 have a fourth (sversion 0x0007F).
The newest workstations have a PCI sound chip which I know little about.

The harmony driver claims to support the 7B, 7E and 7F audio types and has
support for 7A commented out (presumably it doesn't work).  The first
thing to do is to boot the machine, preferably with a 2.6 kernel.
You should see the device inventory which looks something like this:

Found devices:
1. Gecko 80 GSC Core Graphics at 0xf8000000 [1] { 10, 0x0, 0x01c, 0x00085 }
2. Gecko 80 Core BA at 0xf0100000 [2] { 11, 0x0, 0x01c, 0x00081 }
3. Gecko 80 Core SCSI at 0xf0106000 [2/0/1] { 10, 0x0, 0x01c, 0x00082 }
...
15. Gecko 80 (712/80) at 0xfffbe000 [8] { 0, 0x0, 0x601, 0x00004 }
16. Memory at 0xfffbf000 [9] { 1, 0x0, 0x038, 0x00009 }
CPU(s): 1 x PA7100LC (PCX-L) at 80.000000 MHz

Could you send your inventory?  That gives us a place to start looking.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
