Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from student.cs.ucc.ie (student.cs.ucc.ie [143.239.211.125])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4D8AA482A
	for <parisc-linux@parisc-linux.org>; Tue, 18 Dec 2001 13:19:19 -0700 (MST)
Date: Tue, 18 Dec 2001 20:19:38 +0000 (GMT)
From: Markus Grabert <xam@student.cs.ucc.ie>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] HP 9000/782/C240 up and running 0.9.3 (serial) 
In-Reply-To: <Pine.OSF.4.41.0112182001270.30187-100000@student.cs.ucc.ie>
Message-ID: <Pine.OSF.4.41.0112182015450.731-100000@student.cs.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Tue, 18 Dec 2001, Markus Grabert wrote:

sorry for replying myself!

> > Markus Grabert wrote:
>
> My fault, I told you something wrong: my monitor is even not
> capable of 1024x768/72Hz! (It understands however the 1024x768/70 of my
> Sun SPARCstation LX).
> I should have explaned that 1024x768 is the lowest resolution
> of the C240 offers me. The others (1024x768 at 72 or 75Hz) obviously won't
                                     ^^^^^^^^
                                        = 1280x1024

> work. So there is no way of using STI and stifb, since even the lowest
> resolution isn't supported by my monitor.
> The graphic card works however (tested all modes with a 20" monitor
> of a friend).

One more question:
Is it possible to add custom resolutions (mode 6 says something about
custom resolution) ?

greetings max
