From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] gettimeofday() issue on D270
Date: Wed, 30 Aug 2006 10:19:43 -0400
Message-ID: <119aab440608300719l74c4be28m642253dd7d470ab8@mail.gmail.com>
References: <200608272107.k7RL7frm018389@hiauly1.hia.nrc.ca>
	<200608272132.k7RLW9hl018646@hiauly1.hia.nrc.ca>
	<20060830101016.0ea9fe4d.gmsoft@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org
To: "Guy Martin" <gmsoft@tuxicoman.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060830101016.0ea9fe4d.gmsoft@tuxicoman.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 8/30/06, Guy Martin <gmsoft@tuxicoman.be> wrote:
> Thanks for identifying the possible issue. However I'm not sure how that could be fixed.
> What happend when we read from cr16 and then write in a long does 0xffffffff get stored because it overflow ?

In practice we need only guarantee that gettimeoffset() return
positive values to ensure the forward progression of time.

> What would be the best fix for this then ? Process the value returned by cr16 and add one sec for the higher 4bytes and the proceed as usual with the lower bytes ?

The best fix is to identify the wrapping situation. There are 2 or 3
robust ways to do this.

> How does this counter works ? Does it increase or decrease ? How fast is it doing so ?

You need to read the PA 1.1 or PA 2.0 architecture documens which
describe the behaviour of the interval timer and the interrupt
generation. The counter is actually 2 registers, a free-running
counter usually counting at the same speed as the CPU clock, and the
"trigger time" which is always a 32-bit trigger value. When the lower
32-bits of the free-running counter equals the 32-bit trigger, then a
timer interrupt is generated.

Cheers,
Calros.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
