Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta-2.gci.net (mta-2.gci.net [208.138.130.83])
	by dsl2.external.hp.com (Postfix) with ESMTP id C53B6482A
	for <parisc-linux@parisc-linux.org>; Sat, 12 Jan 2002 10:04:33 -0700 (MST)
Received: from mmp-2.gci.net ([208.138.130.81]) by mta-2.gci.net
          (Netscape Messaging Server 4.15) with ESMTP id GPU4RI01.A9F for
          <parisc-linux@parisc-linux.org>; Sat, 12 Jan 2002 08:04:30 -0900
Date: Sat, 12 Jan 2002 08:00:23 -0900 (AKST)
From: Tom <palinux@alaskatech.org>
To: Peter Lavender <plaven@bigpond.net.au>
Cc: parisc <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] bogomips?
In-Reply-To: <005601c19b59$d9645370$090ba8c0@winnie>
Message-ID: <Pine.LNX.4.33.0201120757330.1989-100000@goliath.alaskatech.org>
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

On Sat, 12 Jan 2002, Peter Lavender wrote:

> Hi everyone,
>
> What's a 715/64 equate to in terms of intel arches?
>
> Here's my p90 with 48meg of ram:
> Calibrating delay loop... 35.84 BogoMIPS
>
> and my 715/64 with 128 meg of ram:
> Calibrating delay loop... 63.69 BogoMIPS

As a rough guess, my 715/100 feels like a Pentium chip of roughly twice
the speed, while my C180 feels like a P2 of roughly twice the speed. Don't
know if the bogomips back that up, but that's the way they feel.
