Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from linux.imo.physik.uni-muenchen.de (pD9E4EA6F.dip.t-dialin.net [217.228.234.111])
	by dsl2.external.hp.com (Postfix) with ESMTP id C89E94829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Jan 2003 05:57:48 -0700 (MST)
Received: from linux.imo.physik.uni-muenchen.de (localhost [127.0.0.1])
	by linux.imo.physik.uni-muenchen.de (8.12.6/8.12.6/SuSE Linux 0.6) with ESMTP id h0ACwrHJ030959;
	Fri, 10 Jan 2003 13:58:54 +0100
Received: (from joerg@localhost)
	by linux.imo.physik.uni-muenchen.de (8.12.6/8.12.6/Submit) id h0ACwqhK030957;
	Fri, 10 Jan 2003 13:58:52 +0100
Subject: Re: [parisc-linux] ibm-disk on a hp 735/125
From: Joerg Krebs <joerg.krebs@physik.uni-muenchen.de>
To: Nahkola Mikko <mnahkola@trinms01.ntc.nokia.com>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030110124210.GG2160@aurinko.ntc.nokia.com>
References: <Pine.GSO.4.51.0301091743500.9837@sunhalle66>
	<20030110124210.GG2160@aurinko.ntc.nokia.com>
Content-Type: text/plain
Date: 10 Jan 2003 13:58:51 +0100
Message-Id: <1042203531.19627.11.camel@linux>
Mime-Version: 1.0
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Am Fre, 2003-01-10 um 13.42 schrieb Nahkola Mikko:
> On Thu, Jan 09, 2003 at 05:44:31PM +0100, ext Joerg Krebs wrote:
> 
> > im running a hp 735/125 with a st31200wd 1GB harddisk, connected to the
> > fast-wide scsi-connector, which run's quit nice.
> > But now I want to replace the disk with a larger 4,3GB ibm dcas-34330
> > disk, but I can't get it be detected by the system, I think i used the
> > same jumper settings as on the old seagate drive.
> > at the search for potential boot devices nothing appears.
> 
> I'd say that probably the IBM disk isn't high-voltage. The 735's 
> fast-wide is fast-wide-highvoltage-differential, back then they thought 
> that no one in their right minds would try to do FWSE and no one had 
> thought about LVD yet, or something...
> 

Yes you are right, I found the HP 735 Hardware manual on the openpa
Webside and there i found that the wide-scsi connector is just for HVD

Do you know if any HVD disk is detected by the hp or are there just some
special disks for the hp ?

> And IIRC the -wd in the Seagate model code means about that too. I don't 
> know about IBM specifically.
> 
> > So perhaps someones uses the same harddisk and can tell me the right
> > jumper-settings, the disk itself works fine with a normal PC with a
> > scsi-wide controller.
> 
> Well, if it works in a normal PC, that usually means that it isn't HVD. I 
> only know of two HVD adapters for PCs, Adaptec AHA-1744 and 2944, and 
> those were always expensive ...
> 
> I suppose you could get the disk to work on a single-ended interface or 
> get an appropriate EISA card.
> 
> Besides, do you mean that the 735 FWD interface works in Linux/parisc 
> nowadays? Great... 
> 

No linux/parisc isn`t working with FWD , I suppose, I run my HP still
under HP-UX, i have another hp 735/99 on which I want to install linux
on it, but there i have se disks in it, for now I'm running linux/parisc
only on a 715/75 with an older version of linux/parisc (the one without
hil mouse support)

Thanks for your help

	J.Krebs

> 
> -- 
> Mikko Nahkola   <mikko.nahkola@nokia.com>
> Tre-IN sysadmin <mnahkola@trein.ntc.nokia.com>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
-- 

                         ''~``
                        ( o o )
+------------------.oooO--(_)--Oooo.------------------+
|                                                     |
|                    .oooO                            |
|                    (   )   Oooo.                    |
+---------------------\ (----(   )--------------------+
Joerg Krebs            \_)    ) /
Oettingenstr. 67             (_/
80538 Muenchen
Raum: Z1.16

Tel.: +49-89-2180-9251
Fax.: +49-89-2180-9202

Homepage:
http://www.bmo.physik.uni-muenchen.de/~krebs

------------------------------------------------JK
