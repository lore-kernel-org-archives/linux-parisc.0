Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Arto Jantunen <viiru@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HP9000 problems 
In-Reply-To: Message from Arto Jantunen <viiru@debian.org>
   of "Thu, 17 Oct 2002 10:25:49 +0300." <20021017072549.GA28930@mail1.dt-link.fi>
References: <20021017072549.GA28930@mail1.dt-link.fi> 
Date: Thu, 17 Oct 2002 21:54:10 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021018035411.23C294829@dsl2.external.hp.com>
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

Arto Jantunen wrote:
> My HP9000/R390 crashes when running a 64-bit kernel (it freezes after
> "Enumerating EISA bus") and also crashes when running a 32-bit SMP
> kernel. Is anyone working on fixing Linux for a machine like this?

right now there's a frenzy to get everything we need into 2.5 linux kernel.

In general, you are welcome to post crash information (console output,
"ser pim" for hpmcs) and indicate which kernel you are running
(if it's a standard, prebuilt kernel). If it's an obvious bug or
catches someone's fancy, it will get fixed. On the 2.4.19 kernel.

grant
