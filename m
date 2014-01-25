From: Jeroen Roovers <jer@gentoo.org>
Subject: [C8000] serial console drops input
Date: Sat, 25 Jan 2014 05:41:44 +0100
Message-ID: <20140125054144.4ccfde5e@marga.jer-c2.orkz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

In recent kernels, with the new serial console code for the C8000,
performance is terrible. Typing quickly results in characters getting
dropped (I have no idea where I lose them), pasting results in 9 out of
10 characters being dropped, and I don't see anything on the client
side that could cause this, and I never had this problem with the old
ttyB0 code. While entering a password, some characters never turn up on
the other side and some get echoed back to the client.

Is anyone else seeing this?


Regards,
     jer
