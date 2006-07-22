From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] Mysterious hangs with parisc (a
	send_group_sig_info() analysis)
Date: Sat, 22 Jul 2006 13:29:13 -0400
Message-ID: <119aab440607221029h1acda159mf4c4e5baca2f0c1e@mail.gmail.com>
References: <20060624015935.GJ12481@quicksilver.road.mcmartin.ca>
	<200606240241.k5O2fALQ001885@hiauly1.hia.nrc.ca>
	<20060705164734.GB30640@athena.road.mcmartin.ca>
	<44AD54F0.90508@tiscali.be>
	<20060706183409.GB5692@athena.road.mcmartin.ca>
	<44C1338C.7010607@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: Kyle McMartin <kyle@mcmartin.ca>,
 James.Bottomley@steeleye.com,
 parisc-linux@lists.parisc-linux.org,
 John David Anglin <dave@hiauly1.hia.nrc.ca>
To: "Joel Soete" <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <44C1338C.7010607@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

>         Q4: imho the most important: with 2 gcc where is the couple of ssm/rsm that jejb introduced in his patch:

The *most* important piece of imformation is the pre-compiled source.
You *must* determine that both paths of the if/else are different,
because if they are the same, then GCC is right to remove one of the
paths, and unconditionally call cpu_relax.

Where is the pre-compiled source to prove that the paths aren't identical?

Remember to work towards a solution!

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
