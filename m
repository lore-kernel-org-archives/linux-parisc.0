From: "Martin K. Petersen" <mkp@mkp.net>
Subject: Re: [parisc-linux] PCI card in C160
Date: Mon, 15 Aug 2005 11:46:50 -0400
Message-ID: <yq1slxbfbit.fsf@wilson.lab.mkp.net>
References: <430035F8.9040900@excelcia.org>
	<e6eae0290508142351585ba614@mail.gmail.com>
	<29513.193.160.141.5.1124091800.squirrel@www.puszczka.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Kurt Fitzner <kfitzner@excelcia.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <29513.193.160.141.5.1124091800.squirrel@www.puszczka.com> (Andy
	Walker's message of "Mon, 15 Aug 2005 09:43:20 +0200 (CEST)")
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

>>>>> "Andy" == Andy Walker <ajwalker@broadpark.no> writes:

Andy> I think HP did this due to bugs in the Dino PCI bridge. 

Yup.


Andy> Certain revisions have bugs that will quite likely corrupt data
Andy> on cards that HP haven't certified as working correctly (i.e. HP
Andy> cards are known not to exercise the bugs). 

Well.  The old rev. Dino does corrupt data (Actually, the HP errata
note is funny.  It states that Dino will cause corruption but *only*
when you do I/O through it.  Good thing I/O is not something you do on
a regular basis 8).

Anyway.  For a graphics card it's not a big deal whether a pixel on
the display gets corrupted.  And consequently - as far as I remember -
the firmware will reject anything but Visualize cards.

The solution is to find a new I/O daughterboard on ebay.  There's
probably a higher success rate in terms of getting a newer rev. Dino
if you get a board from a scrapped C180/C200/C240.  Join the exclusive
circle of Frankenbox owners!

-- 
Martin K. Petersen      http://mkp.net/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
