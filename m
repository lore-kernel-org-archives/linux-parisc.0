Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from interzone.ucc.ie (interzone.ucc.ie [143.239.1.134])
	by dsl2.external.hp.com (Postfix) with ESMTP id DA2794873
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Jun 2002 14:29:11 -0600 (MDT)
Date: Fri, 21 Jun 2002 21:28:52 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Patrick Caulfield <patrick@tykepenguin.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 0.9.3 Audio on C110
In-Reply-To: <20020621143955.GB1385@tykepenguin.com>
Message-ID: <Pine.LNX.4.44.0206212123170.4556-100000@sal.ucc.ie>
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

Hi palinuxer,

On Fri, 21 Jun 2002, Patrick Caulfield wrote:

> The driver is called "harmony" - I have mine hard compiled into the kernel.
>
> patrick

This reminds me of something I wanted to ask for a long time:

It seems that the harmony mixer is not perfectly supported;
Volume doesn't work, and there are just two things I can change,
IGain and OGain (latter effects the Output volume).
There is not even a way to change the balance etc.
Moreover most applications expect at least "volume" to be working,
so this is kind of annoying. Despite this it's working flawlessly!

So to the question: is there any work planned in improving harmony
support (in the near future) ? E.g. an enhanced mixer support and
support for recording?

greetings max
