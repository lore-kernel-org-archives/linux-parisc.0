Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 531F34829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Sep 2002 09:25:00 -0600 (MDT)
Date: Thu, 19 Sep 2002 08:27:56 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HP/UX binaries
Message-ID: <20020919152756.GA12481@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20020919151734.GH845@tykepenguin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020919151734.GH845@tykepenguin.com>
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

In reference to a message from Patrick Caulfield, dated Sep 19:
> How do I go about trying to run HP/UX binaries on parisc-linux ?
> 
> In particular I would like to get bitkeeper running as there's an HP/UX binary
> for that but no HP/Linux port :(

Bug Larry McVoy about it. :-) Apparently he was considering a palinux
port at some point.

we only support static SOM binaries on palinux....  from binfmt_som.c:

static inline int
do_load_som_library(struct file *f)
{
/* No lib support in SOM yet.  gizza chance.. */
        return -ENOEXEC;
}

randolph
