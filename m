Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 508E44829
	for <parisc-linux@lists.parisc-linux.org>; Sun,  9 Mar 2003 18:50:09 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.12)
	id 18sCQX-0001jO-00; Mon, 10 Mar 2003 01:50:05 +0000
Date: Mon, 10 Mar 2003 01:50:05 +0000
From: Matthew Wilcox <willy@debian.org>
To: "David S. Miller" <davem@redhat.com>
Cc: willy@debian.org, grundler@dsl2.external.hp.com,
	jsm@udlkern.fc.hp.com, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: RFC: mmap patch
Message-ID: <20030310015005.GA5278@parcelfarce.linux.theplanet.co.uk>
References: <20030308231125.M3865@parcelfarce.linux.theplanet.co.uk> <20030308.150214.30103426.davem@redhat.com> <20030309144225.O3865@parcelfarce.linux.theplanet.co.uk> <20030309.133830.82279538.davem@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030309.133830.82279538.davem@redhat.com>
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

On Sun, Mar 09, 2003 at 01:38:30PM -0800, David S. Miller wrote:
> I think the real issue is SHMLBA isn't being honored, right?

I don't think so.. according to cachetlb.txt:

If your D-cache has this problem, first define asm/shmparam.h SHMLBA
properly, it should essentially be the size of your virtually
addressed D-cache (or if the size is variable, the largest possible
size).  This setting will force the SYSv IPC layer to only allow user
processes to mmap shared memory at address which are a multiple of
this value.

That isn't where the problem lies.  This missing flush is in
shmem_getpage(), round about line 906 in 2.5.64.  Really, this should
be doing a clear_user_page() -- but not all callers of this routine have
a user address to pass on.

> The whole purpose of SHMLBA is to ensure a particular alignment
> for shared memory anonymous regions, if that isn't happening anymore
> that is a bug.

I thought this was to deal with user-user coherency problems, not
user-kernel?

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
