From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Is the message from 'make modules_install'
	important?
Date: Sun, 3 Jul 2005 09:07:52 -0400 (EDT)
Message-ID: <200507031307.j63D7qPf015325__23406.3551681631$1416623831$gmane$org@hiauly1.hia.nrc.ca>
References: <5.1.1.6.1.20050703124208.02a57290@pop.singnet.com.sg>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: jllee@singnet.com.sg (J. L. Lee)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <5.1.1.6.1.20050703124208.02a57290@pop.singnet.com.sg> from "J.
	L. Lee" at Jul 3, 2005 12:45:29 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Did the 'make modules_install' complete its task or it stopped prematurely? 
> Pls adv.

Another related item is 'make install'.  In 2.6.10, it did a nicer job
of installing the kernel, and the vmlinux, config and System.map links.
It also searched for palo.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
