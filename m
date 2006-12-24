From: Kyle McMartin <kyle@parisc-linux.org>
Subject: Re: [parisc-linux] fstatat64 and newfstatat syscalls
Date: Sun, 24 Dec 2006 14:08:43 -0500
Message-ID: <20061224190843.GE8504__46568.8493488871$1416624240$gmane$org@athena.road.mcmartin.ca>
References: <200612230049.41484.deller@gmx.de> <200612230054.34497.deller@gmx.de> <5b2e36650612241019i7ad750a7v6c26a722972e09e1@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Helge Deller <deller@gmx.de>,
 parisc-linux@lists.parisc-linux.org
To: Jeff Bailey <jbailey@raspberryginger.com>
Return-Path: <kyle@athena.road.mcmartin.ca>
In-Reply-To: <5b2e36650612241019i7ad750a7v6c26a722972e09e1@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Dec 24, 2006 at 01:19:59PM -0500, Jeff Bailey wrote:
> 
> Umm, isn't this a public ABI change?  would it be better to assign a
> new syscall number and cope correctly with the old one?
> 

Meh. I doubt it will be a problem.
