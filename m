Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8CE924829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  9 Dec 2002 09:18:22 -0700 (MST)
Message-Id: <200212091618.gB9GIF0c012366@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: Trap handler
To: tausq@debian.org
Date: Mon, 9 Dec 2002 11:18:14 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20021209061913.GM21187@tausq.org> from "Randolph Chung" at Dec 8, 2002 10:19:13 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> > > Here it is.
> > 
> > well, something is just very broken, even this simple code triggers the
> > bug:
> 
> and with Grant's help, it's fixed in 2.4.20-pa12 :)

The system doesn't seem to drop core on a segmentation fault anymore.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
