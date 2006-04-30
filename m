From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] Heavy Iron Reference Docs
Date: Sun, 30 Apr 2006 08:12:24 -0500
Message-ID: <200604300812.24276.mszick@morethan.org>
References: <200604292250.49455.mszick@morethan.org>
	<20060430070302.GA32765@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060430070302.GA32765@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun April 30 2006 02:03, you wrote:
> 
> Seems to state V2500 NUMA implementation is NOT supported by the general
> PA 2.0 architecture. Be very careful to not generalize statements made in
> the V-class specific documents.
> 

Grant, I wish it was that simple.

What you point out of about the V2500 seems
to be exact.

The V2200 has different memory hardware and
a different means for coherent semaphores.

My biggest mistake was to think that we can
go by the cpu version. There will have to be 
another way found.

HP-UX uses an external library for semaphores
to get it correct, at least sometimes.
The S... is getting deep.

What can be demonstrated at this moment is:

PA8500 - works (?)
PA8600 - broke
PA8700 - works
PA8800 - ???
PA8900 - broke (?)

The lack of documentation that would tell us
why does not mean we have given up though.

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
