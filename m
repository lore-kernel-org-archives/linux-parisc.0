Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id C9E514829
	for <parisc-linux@lists.parisc-linux.org>; Fri,  6 Dec 2002 11:04:42 -0700 (MST)
Message-Id: <200212061804.gB6I4aJD006826@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] linking
To: leandro.farinati@hp.com (FARINATI, LEANDRO)
Date: Fri, 6 Dec 2002 13:04:36 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <9A0482A7BD2506488AD9417C93F3714F9CDC0A@xsp01.brazil.hp.com> from "FARINATI,LEANDRO" at Dec 6, 2002 12:56:41 pm
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

> 	The main function is in main.c(main.o)

Are you sure?  You said the modules were precompiled.  You can
use nm, objdump or readelf to look at the symbols main.o.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
