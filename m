From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] NCR SCSI hardware documentation
Date: Wed, 4 Oct 2006 08:05:13 -0500
Message-ID: <200610040805.14001.mszick@morethan.org>
References: <200609250926.40678.mszick@morethan.org>
	<1159462892.3392.2.camel@mulgrave.il.steeleye.com>
	<200609281347.34279.mszick@morethan.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: James Bottomley <James.Bottomley@steeleye.com>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200609281347.34279.mszick@morethan.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu September 28 2006 13:47, Michael S. Zick wrote:
>
> The SCSI SCRIPTS Processors Programming Guide:
> http://www.lsilogic.com/files/docs/techdocs/storage_stand_prod/PCISCSICont/Software/8XX_21.pdf
> 
> This document also covers 7xx SCRIPTS processors - the comment about 770+ comes about because
> this is an LSI document and controllers prior to the 770 acquired from Symbolics where not
> continued. [confirmed]
> This _is_ the programming manual for the 720 when limited to the 720 instruction set ...
> 

The following two items are posted for the use of the parisc-Linux
driver development community by permission of LSI-Logic.  
No NDA required for either item, additional
re-distribution requires permission from LSI-Logic.

The 53C720/53C720SE data manual:
http://www.morethan.org/parisc/53C720_Data_Manual_Rev_3_1.PDF

The SCSI SCRIPTS assembler:
http://www.morethan.org/parisc/nasm302.zip
(includes 700, 710, 720 instruction sets)

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
