From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] My a500 reported a bug during gsp reset (Good dump)
Date: Mon, 17 Jul 2006 18:35:32 -0400
Message-ID: <119aab440607171535m76f159fej192f55bad4ab843@mail.gmail.com>
References: <119aab440607171419h26cb2aa5ide166b94dbf94796@mail.gmail.com>
	<1153171572.3704.8.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "James Bottomley" <James.Bottomley@steeleye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1153171572.3704.8.camel@mulgrave.il.steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 7/17/06, James Bottomley <James.Bottomley@steeleye.com> wrote:
>
> What's on IRQ69?
>

           CPU0
 64:   10891024             CPU  timer
 65:      78367  IO-SAPIC-level  eth0
 66:         33  IO-SAPIC-level  sym53c8xx
 67:      94746  IO-SAPIC-level  sym53c8xx, sym53c8xx
 68:      14573  IO-SAPIC-level  sym53c8xx
 69:     200051  IO-SAPIC-level  serial

c.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
