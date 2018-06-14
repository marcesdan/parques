 <div class="table-responsive-sm">
   <table id="table" class="table table-striped table-bordered compact table-sm dt-responsive nowrap shadow" style="width:100%">
     <thead>
       <tr class="text-dark font-weight-bold">
         <th class="text-center">Área protegida</th>
         <th class="text-center">Region</th>
         <th class="text-center">Provincia</th>
         <th class="text-center">Localidad</th>
       </tr>
     </thead>
     <g:each in="${areaProtegidaList}" var="areaProtegida">
       <tr class="areaProtegida{$areaProtegida.id} text-dark">
         <td>
           <a href="/area-protegida/${areaProtegida.id}" class="text-success font-weight-bold">
             ${areaProtegida.parque}
           </a>
         </td>
         <td>${areaProtegida.delegacion}</td>
         <td>${areaProtegida.provincia}</td>
         <td>${areaProtegida.localidad}</td>
       </tr>
     </g:each>
   </table>
</div> 