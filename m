Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mgw-x4.nokia.com (mgw-x4.nokia.com [131.228.20.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id CB412482B
	for <parisc-linux@parisc-linux.org>; Tue, 18 Feb 2003 01:44:45 -0700 (MST)
Received: from esvir03nok.nokia.com (esvir03nokt.ntc.nokia.com [172.21.143.35])
	by mgw-x4.nokia.com (Switch-2.2.1/Switch-2.2.0) with ESMTP id h1I8lgm29054
	for <parisc-linux@parisc-linux.org>; Tue, 18 Feb 2003 10:47:42 +0200 (EET)
Date: Tue, 18 Feb 2003 10:44:42 +0200
From: Nahkola Mikko <mnahkola@trinms01.ntc.nokia.com>
To: ext Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Joel Soete <jsoe0708@tiscali.be>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] .config fo a N class?
Message-ID: <20030218084442.GP3715@aurinko.ntc.nokia.com>
References: <3E48B5950000297E@ocpmta3.freegates.net> <3E4ABE5000002044@ocpmta2.freegates.net> <20030218025230.GA13514@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <20030218025230.GA13514@dsl2.external.hp.com>
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

On Mon, Feb 17, 2003 at 07:52:30PM -0700, ext Grant Grundler wrote:
> On Mon, Feb 17, 2003 at 06:51:01PM +0100, Joel Soete wrote:

> > eth0 Digital DS21143 Tulip rev 65 at 0x80 ... irq 128
> > Is there known problem with this type of NIC?

> yes - there was. But built-in should work. add-on cards had problems.

Hey, that's the same revision as the one I tried in a C240 ... 
A3738-60001 ANA-6911A/AUI? A combo card with 10/100bT, 10b2, and AUI? 

Come to think of it, is it at all reasonable to assume that the same chip 
revision would be likely to mean the cards are similar?


Anyway, mine still doesn't work as of today, but I haven't worked on it 
for a while... oh well, at least on HP-UX it'd be supported on an N, 
right?


-- 
Mikko Nahkola   <mikko.nahkola@nokia.com>
Tre-IN sysadmin <mnahkola@trein.ntc.nokia.com>
