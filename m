Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpde02.sap-ag.de (smtpde02.sap-ag.de [194.39.131.53])
	by dsl2.external.hp.com (Postfix) with ESMTP id 65F63482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Apr 2002 08:34:19 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <helge.deller@sap.com>
To: "Kenneth Westelinck" <kennywest1@hotmail.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] not freeing initmem and power button
Date: Mon, 15 Apr 2002 16:34:18 +0200
References: <F92wTQUS2cYmqJpuUdJ00006859@hotmail.com>
In-Reply-To: <F92wTQUS2cYmqJpuUdJ00006859@hotmail.com>
MIME-Version: 1.0
Message-Id: <200204151634.18455.helge.deller@sap.com>
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

On Monday 15 April 2002 13:59, Kenneth Westelinck wrote:
> >The power-button should work if you update to a newer kernel (>=
> >2.4.18-pa19).
>
> Cool, does this mean: if I push the button, the system will do a clean
> shutdown? Or if I push the button, nothing happens?

It should shutdown cleanly and power-off afterwards.

> Is there an easy way to disable this. 

Hmm, not yet. But thanks for the idea, maybe I can add this....

> I mean, I only want to shutdown the
> machine using the command line (call me a freak ;)).
> Thanks.

read
http://lists.parisc-linux.org/pipermail/parisc-linux/2002-April/016052.html

Helge
