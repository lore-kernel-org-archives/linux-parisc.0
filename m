Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta04bw.bigpond.com (mta04bw.bigpond.com [139.134.6.87])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1D5B54829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Oct 2002 20:27:26 -0600 (MDT)
Received: from piglet.sspl.net.au ([144.135.24.69]) by
          mta04bw.bigpond.com (Netscape Messaging Server 4.15 mta04bw Jul
          16 2002 22:47:55) with SMTP id H4045L00.BOY for
          <parisc-linux@lists.parisc-linux.org>; Tue, 15 Oct 2002 12:27:21 +1000
Received: (from pete@localhost)
	by piglet.sspl.net.au (8.9.3/8.9.3) id MAA05763
	for parisc-linux@lists.parisc-linux.org; Tue, 15 Oct 2002 12:27:21 +1000
Date: Tue, 15 Oct 2002 12:27:20 +1000
From: Peter Lavender <plaven@bigpond.net.au>
To: PARISC Mailing List <parisc-linux@lists.parisc-linux.org>
Message-ID: <20021015122720.E893@piglet>
Reply-To: plaven@bigpond.net.au
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] help!!! apt-get dist-upgrade
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

Hi Everyone,

I'm not having much luck finding a solution to this problem.

I kicked off apt-get update then apt-get dist-upgrade, however I was
ssh'ed into the box when I did this.  Becuase the connect is flakey,
the ssh connection reset, so the last thing apt-get dist-upgrade has
showing was a prompt.

Now I have ssh'ed back to the box.  How can I basically reconnect to
the process and issue the Y to go ahead and complete the upgrade?

I'd rather not kill it unless it's safe to do so.

A ps aux | grep apt shows the process still there.

Thanks,



Pete.

-- 
				Due to a lack of imagination, 
				this signature will remain 
				under construction indefinitely.
