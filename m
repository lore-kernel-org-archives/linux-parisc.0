Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tyke.pjc.net (public1-leed3-6-cust7.leed.broadband.ntl.com [80.7.68.7])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8EEB34829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Sep 2002 12:51:33 -0600 (MDT)
Received: from patrick by tyke.pjc.net with local (Exim 3.35 #1 (Debian))
	id 17s6Oh-0001pz-00
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Sep 2002 19:51:31 +0100
Date: Thu, 19 Sep 2002 19:51:31 +0100
From: Patrick Caulfield <patrick@tykepenguin.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HP/UX binaries
Message-ID: <20020919185131.GB6961@tykepenguin.com>
References: <20020919151734.GH845@tykepenguin.com> <20020919152756.GA12481@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
In-Reply-To: <20020919152756.GA12481@tausq.org>
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

On Thu, Sep 19, 2002 at 08:27:56AM -0700, Randolph Chung wrote:
> In reference to a message from Patrick Caulfield, dated Sep 19:
> > How do I go about trying to run HP/UX binaries on parisc-linux ?
> > 
> > In particular I would like to get bitkeeper running as there's an HP/UX binary
> > for that but no HP/Linux port :(
> 
> Bug Larry McVoy about it. :-) Apparently he was considering a palinux
> port at some point.
> 
> we only support static SOM binaries on palinux....  from binfmt_som.c:
> 
> static inline int
> do_load_som_library(struct file *f)
> {
> /* No lib support in SOM yet.  gizza chance.. */
>         return -ENOEXEC;
> }

aha. That'll teach me to read the FAQ rather than the code :-)
 
patrick
