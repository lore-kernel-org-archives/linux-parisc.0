Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mgw-x4.nokia.com (mgw-x4.nokia.com [131.228.20.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 692BA4834
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Feb 2003 01:27:37 -0700 (MST)
Received: from esvir03nok.nokia.com (esvir03nokt.ntc.nokia.com [172.21.143.35])
	by mgw-x4.nokia.com (Switch-2.2.1/Switch-2.2.0) with ESMTP id h1L8UTm08186
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Feb 2003 10:30:29 +0200 (EET)
Received: from esebh002.NOE.Nokia.com (unverified) by esvir03nok.nokia.com
 (Content Technologies SMTPRS 4.2.5) with ESMTP id <T608c5519eaac158f230cc@esvir03nok.nokia.com> for <parisc-linux@lists.parisc-linux.org>;
 Fri, 21 Feb 2003 10:27:27 +0200
Received: (from mnahkola@localhost)
	by aurinko.ntc.nokia.com (8.11.6/8.11.6) id h1L8RR110293
	for parisc-linux@lists.parisc-linux.org; Fri, 21 Feb 2003 10:27:27 +0200 (EET)
Date: Fri, 21 Feb 2003 10:27:26 +0200
From: Nahkola Mikko <mnahkola@trinms01.ntc.nokia.com>
To: PARISC Linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] boot console wrong.
Message-ID: <20030221082726.GH6523@aurinko.ntc.nokia.com>
References: <3E55A3FC.C06BFE43@optushome.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <3E55A3FC.C06BFE43@optushome.com.au>
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

On Fri, Feb 21, 2003 at 03:58:52AM +0000, ext Rod Smart wrote:

>     I have a C-180 and when in the Main Menu (booting) I have previously
> setup the Console path to Serial, what input do I need to set it back to
> normal console (Keyboard/screen) ?

> >   Console path:         SERIAL_1.9600.8.none

>     I have installed Debian through this console, and would like to play
> with it the usual way now ;o)

Um ... "path console graphics" could be a good starting point. It 
probably tells you that "graphics" isn't a good path and shows a list of 
what could be, but that's almost as good.

Not sure though, I haven't had the chance to play with a C180, but that's 
what I do with the other Cxx0s.


-- 
Mikko Nahkola   <mikko.nahkola@nokia.com>
Tre-IN sysadmin <mnahkola@trein.ntc.nokia.com>
