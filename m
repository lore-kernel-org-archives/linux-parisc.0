Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "=?iso-8859-1?Q?Jo=EBl_Soete?=" <jso@europay.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] evms-0.9.1 && hppa (follow ...) 
In-Reply-To: Message from "=?iso-8859-1?Q?Jo=EBl_Soete?=" <jso@europay.com>
   of "Wed, 06 Mar 2002 19:57:31 +0100." <OF5C49A386.7B121133-ONC1256B74.00656CC0@com>
References: <OF5C49A386.7B121133-ONC1256B74.00656CC0@com> 
Date: Wed, 06 Mar 2002 15:19:09 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020306221909.DF1EE484D@dsl2.external.hp.com>
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

"=?iso-8859-1?Q?Jo=EBl_Soete?=" wrote:

>           printk(KERN_ERR "--evms: %s, %s call, ckp7p: io_sector_offset
> =%llu.\n", __FILE__ , __FUNCTION__, io_sector_offset );
>           user_buffer_ptr = user_parms->buffer_address;
>           printk(KERN_ERR "--evms: %s, %s call, ckp7pp.\n", __FILE__ ,
> __FUNCTION__ );
....

> So it seems to failled on the assignement: "user_buffer_ptr =
> user_parms->buffer_address;" . That is over my understanding without much
> help. Any idea ?

Could it be that "user_parms->buffer_address" should really be
"tmp->buffer_address"?

Just wondering if the copy_from_user() higher up in the code means
arg points to something in userspace. getting stack unwinds
for problems like this would be really nice...(hint hint)

grant
