Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 06928491D
	for <parisc-linux@lists.parisc-linux.org>; Wed, 15 Oct 2003 08:39:39 -0600 (MDT)
Date: Wed, 15 Oct 2003 10:35:59 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Ulrich Drepper <drepper@redhat.com>
Cc: libc-alpha <libc-alpha@sources.redhat.com>,
	parisc-linux@lists.parisc-linux.org
Message-ID: <20031015143558.GG22495@systemhalted>
References: <20031012213226.GE23999@systemhalted> <3F8CDFD6.1010300@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F8CDFD6.1010300@redhat.com>
Subject: [parisc-linux] Re: [PATCH] Sysdeps changes for hppa.
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

Ulrich,

> I've applied this patch, but only because I really don't care how the PA
> port looks.

I didn't think the patch was too ugly, but then again a father thinks
all his children are beautiful.

> The semtimedop definition is completely wrong.  If you want all
> syscall,s use appropriate headers.

Moot point. We know why it's there, because changes don't propagate
everywhere as fast as we'd like.

> You've modified the patch by hand and broke it, forcing me to do clean up.

Unforgivable. Please reject patches immediately if this happens again. 
I will produce a correct patch.

> The coding style is completely wrong and a terrible mess.  The coding
> standard document is available, read it.

Suggestions accepted. I will reread the document.
 
> The preprocessor directive indentation is wrong or non-existing.

Never non-existent. Incorrect yes.

Cheers,
Carlos.
