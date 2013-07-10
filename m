From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: agp/parisc-agp: allow binding of user memory
 to the AGP GART
Date: Wed, 10 Jul 2013 21:17:55 +0200
Message-ID: <51DDB363.3050208@gmx.de>
References: <76F511EB-1172-4753-A8AC-B14497EF8121@p0n4ik.tk> <51DDB2AF.4030805@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1251
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: gnidorah@p0n4ik.tk
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <51DDB2AF.4030805@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Alex,

On 07/10/2013 09:14 PM, Helge Deller wrote:
> On 07/10/2013 08:17 AM, gnidorah@p0n4ik.tk wrote:
>> The patch allows binding of user memory to the AGP GART=20
>> on systems with HP Quicksilver AGP bus. This resolves 'bind memory f=
ailed'=20
>> error seen in dmesg:
>>
>> [   29.365973] [TTM] AGP Bind memory failed.
>> =85
>> [   29.367030] [drm] Forcing AGP to PCI mode=20
>>
>> The system doesn't more fail to bind the memory, and hence not falli=
ng
>> back to the PCI mode (if other failures aren't detected).
>>
>> This is just a simple write down from the following patches:
>> agp/amd-k7: Allow binding user memory to the AGP GART [1]
>> agp/hp-agp: Allow binding user memory to the AGP GART [2]
>>
>> Both fixes are in upstream.
>>
>> [1] https://lkml.org/lkml/2010/10/15/469
>> [2] http://marc.info/?l=3Dlinux-ia64&m=3D131412890819311&w=3D2


Please send an Signed-off-by: line for your patch too...

Helge




>=20
> Thanks for the patch!!!
>=20
> Could you please attach patches inline (as text) next time?
> Our patchwork tool (https://patchwork.kernel.org/project/linux-parisc=
/list/) missed to pick up your patch too.
>=20
> Furthermore, I just noticed that vger.kernel.org stopped forwarding m=
e mails to the mailing list
> during the last few days. So, I would have missed your patch if I wou=
ldn't have noticed the failing forwarding.
>=20
> Thanks,
> Helge
>=20
> PS: I attached it here again for patchwork....
>=20
>=20
> diff --git a/drivers/char/agp/parisc-agp.c b/drivers/char/agp/parisc-=
agp.c
> index 94821ab..9576fad 100644
> --- a/drivers/char/agp/parisc-agp.c
> +++ b/drivers/char/agp/parisc-agp.c
> @@ -129,7 +129,8 @@ parisc_agp_insert_memory(struct agp_memory *mem, =
off_t pg_start, int type)
>  	off_t j, io_pg_start;
>  	int io_pg_count;
> =20
> -	if (type !=3D 0 || mem->type !=3D 0) {
> +	if (type !=3D mem->type ||
> +		agp_bridge->driver->agp_type_to_mask_type(agp_bridge, type)) {
>  		return -EINVAL;
>  	}
> =20
> @@ -175,7 +176,8 @@ parisc_agp_remove_memory(struct agp_memory *mem, =
off_t pg_start, int type)
>  	struct _parisc_agp_info *info =3D &parisc_agp_info;
>  	int i, io_pg_start, io_pg_count;
> =20
> -	if (type !=3D 0 || mem->type !=3D 0) {
> +	if (type !=3D mem->type ||
> +		agp_bridge->driver->agp_type_to_mask_type(agp_bridge, type)) {
>  		return -EINVAL;
>  	}
> =20
>=20

--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
