# Adding function for question 4b
vol_qry <-
  function(id, from, to) {
    raw_qry <-
      '
        {
     trafficData(trafficRegistrationPointId: ".start id .end") {
    volume {
      byHour(from: ".start from .end", to: ".start to .end") {
        edges {
          node {
            from
            to
            total {
              volumeNumbers {
                volume
              }
            }
          }
        }
      }
    }
     }
    }
    '
    return(glue::glue(raw_qry,
                      .open = ".start",
                      .close = ".end"))
  }



GQL(
  vol_qry(
    id=stations_metadata_df$id[1], 
    from=to_iso8601(stations_metadata_df$latestData[1],-4),
    to=to_iso8601(stations_metadata_df$latestData[1],0)
  ),
  .url = configs$vegvesen_url
)



