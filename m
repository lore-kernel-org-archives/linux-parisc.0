Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA01005
	for <parisc-linux@puffin.external.hp.com>; Fri, 26 Jan 2001 13:01:30 -0700
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 26 Jan 2001 20:05:21 -0000
Received: from ottawa.linuxcare.com (HELO linuxcare.com) (@216.208.98.2)
  by smtp.linuxcare.com with SMTP; 26 Jan 2001 20:05:23 -0000
Sender: jvinet@mailserv2.iuinc.com
Message-ID: <3A71D9B7.D582ECD2@linuxcare.com>
Date: Fri, 26 Jan 2001 15:10:31 -0500
From: Jane Vinet <jvinet@linuxcare.com>
MIME-Version: 1.0
To: "parisc-linux@thepuffingroup.com" <parisc-linux@thepuffingroup.com>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] http://parisc-linux.org/ - A New Look!
List-ID: <linux-parisc.vger.kernel.org>

OK, so after many reviews, revisions, discussions the new web site is
live.  Many, many thanks to everyone who endeavored so hard to give the
site a facelift and for constructive feedback which allowed us to create
what we hope will be a dynamic site that is easier to navigate through;
will allow new users to the to site to navigate faster to information
such as FAQs and Supported Hardware, but keeps all of the important
aspects and history that makesthis a space for Open Source developers on
PA RISC Linux to keep the community up to date on all of the trials and
tribulations of the port.  Last but not least, we hope to entice other
Open Source developers in the community to volunteer for tasks on the To
Do list.

A sneak preview courtesy of CVS allowed many of you time to review the
changes and provide useful feedback that had us make the following
changes:

1) Alex - renamed all epl to x files
- redid a Makefile that enables anyone to host the pages anywhere,
without embperl
- changed the embperl syntax to include headers and footers to a new one
2) test is too small - web team removed all the specified fonts
3) Title bars don't mean anything - Jane modified to pick up names of
all of the individual pages
4) All references to thepuffingroup.com have been replaced with
parisc-linux.org
5) Alex added a "Page Last Modified Feature" to time/date stamps all
updates from CVS

Some comments which were made that we did not address were the
following:
1. Too much boilerplate HTML which will quickly get out of sync between
the different files.
   I'm still not quite sure what this comment meant, but I have synched
up both sites so all _content_ is current.
2. Image map should be separate images - it is a design issue - left in
tact.
5. too many tables - not changed
7. too many directories with just one file - done for growth purposes,
consensus was it would stay the same.

While looking through if you notice any glaring errors, broken links,
etc., please send me an email and I will try to address them as quickly
as possible.

Again thanks to everyone at Linuxcare, HP and in the O/S community who
helped out with giving us a new look for a new year!

Jane
-- 
Jane Vinet, Director Professional Services/Canadian Operations
Linuxcare, Inc. 613.562.9260 (tel), 613.562.9700 fax
jvinet@linuxcare.com, http://www.linuxcare.com/
Linuxcare, Support for the Revolution
