From: Stuart Brady <sdbrady@ntlworld.com>
Subject: Re: [parisc-linux] J5000 LCD heartbeat
Date: Mon, 21 Mar 2005 13:43:26 +0000
Message-ID: <20050321134326.GA19102@ntlworld.com>
References: <200503191959.05972.dmp@davidmpye.dyndns.org>
	<20050320210357.53534d01@Tatooine.r3z0>
	<200503202257.31924.dmp@davidmpye.dyndns.org>
	<200503202317.05481.dmp@davidmpye.dyndns.org>
	<20050321045506.GA18458@ntlworld.com>
	<20050321071945.GA10108@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050321071945.GA10108@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Mar 21, 2005 at 12:19:45AM -0700, Grant Grundler wrote:
> 
> Hrm...for LCD, can we program all 4 independently?

Surely not -- they share the same command/data registers, so the command
byte for one register could be written, with the data for another one.
If this isn't happening, that must be because only one LED is being
updated at a time, but I don't think we should rely on that.

> On my j6k the change in LCD heartbeat was very faint.
> LCD has a much slower/longer response time than an LED.
> I've basically doubled the "time on" and now heart beat is easy to see.
> But if someone knows the response time of the LCD panels, that
> should make it obvious what the right values would be.

The previous "time on" isn't great on real LEDs, either, but it looks
a bit more like a heartbeat.  I'll experiment with this, and see if I
can find a good compromise.

Thanks,
-- 
Stuart Brady
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
