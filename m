From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] User space locks -- what's wrong
Date: Mon, 12 Jun 2006 00:01:23 -0600
Message-ID: <20060612060123.GB24813@colo.lackof.org>
References: <119aab440606111942o1be5e11bw6ede4fa941f01778@mail.gmail.com>
	<200606120303.k5C33wIi002802@hiauly1.hia.nrc.ca>
	<119aab440606112013s71bc1daen46041756ce843d14@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440606112013s71bc1daen46041756ce843d14@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jun 11, 2006 at 11:13:33PM -0400, Carlos O'Donell wrote:
> Reading the thread register is a single mfctl, I don't know if that is
> considered slow?

I believe it depends on the source of the "Move From".
But I can't find a table with timing info. (e.g. mfctl CR16).

I did find this bit though:

| 	Most control operations (the "light weight" control ops) are
| handled by a mechanism that is very similar to the way that C/B
| dependencies are handled. The major differences are that there
| are no control rename registers, and there is no bypassing.
| Thus, an instruction that is dependent on a control op will not
| be able to execute until the control op retires. 
...

"Heavy Weight" control ops are the ones where the instruction execution
is serialized completely.

hth,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
