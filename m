Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Tom <palinux@alaskatech.org>
Cc: PA-RISC Linux List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] C180 oddness 
In-Reply-To: Message from Tom <palinux@alaskatech.org>
   of "Wed, 02 Oct 2002 09:47:59 -0800." <Pine.LNX.4.44.0210020925510.6688-100000@wolf.alaskatech>
References: <Pine.LNX.4.44.0210020925510.6688-100000@wolf.alaskatech> 
Date: Wed, 02 Oct 2002 23:30:33 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021003053033.9C5E64829@dsl2.external.hp.com>
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

Tom wrote:
> I couldn't ssh back in, so I checked the console, but minicom wouldn't
> get a response. Power-cycled the HP, still no messages on console, no
> errors on the LCDs, and eventually (several minutes) a heartbeat light.
...
> Anyone have any ideas how to rescue this, or what could have caused it?

Just some thoughts:
o if ssh doesn't work, try ping. ping will give a clue how far into the
  initialization the kernel got.

o after cyclepower on a system configured to run console on serial port,
  not seeing PDC init messages on the serial port suggests a HW problem.

o try another serial cable or a different "client" to start ruling
  out issues with serial connection.

> but still
> get the same lack of results. Minicom is set to 9600/8N1/VT100, which is
> what worked last time I used the console this way...

settings are correct.


grant
