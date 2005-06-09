From: "Jim Hull" <jim.hull@hp.com>
Subject: RE: [parisc-linux] Remove __ldcw_align for PA-RISC 2.0 processors
Date: Thu, 9 Jun 2005 10:32:34 -0700
Message-ID: <200506091732.KAA07794@lucy.cup.hp.com>
References: <20050609054700.GA9450@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="US-ASCII"
Cc: parisc-linux@lists.parisc-linux.org
To: "'Grant Grundler'" <grundler@parisc-linux.org>,
 "'Kyle McMartin'" <kyle@fattire.cabal.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050609054700.GA9450@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Grant wrote: 

> Jim Hull (HP PARISC/IPF Architect) published an errata later
> indicating that the alignment could be relaxed to "native access"
> (ie 4 byte for ldcw) if ",co" (Coherent Operation) completer 
> was specified.
> The email was dated Jan 29th, 2003.
> But I can't a direct public reference of it. :^(

The public errata are here:

 
http://h21007.www2.hp.com/dspp/tech/tech_TechDocumentDetailPage_IDX/1,1701,592,0
0.html

and the semaphore alignment change is here:

 
http://h21007.www2.hp.com/dspp/tech/tech_TechDocumentDetailPage_IDX/1,1701,5310,
00.html

 -- Jim


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
